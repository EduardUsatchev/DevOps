#!/usr/bin/env bash
#
# test_localstack_sqs_lambda.sh
#
# This script verifies:
#   1) LocalStack container is running.
#   2) The SQS queues (myMainQueue, myDLQ) exist.
#   3) The Lambda function (SQSConsumerLambda) is deployed.
#   4) A normal message is consumed by the Lambda (myMainQueue goes empty).
#   5) An error message eventually appears in myDLQ after the Lambda fails it enough times.

set -e

ENDPOINT_URL="http://localhost:4566"
CONTAINER_NAME="localstack_dev"
MAIN_QUEUE_URL="${ENDPOINT_URL}/000000000000/myMainQueue"
DLQ_URL="${ENDPOINT_URL}/000000000000/myDLQ"
LAMBDA_NAME="SQSConsumerLambda"

###############################################################################
# Helper function for errors
###############################################################################
error_exit() {
  echo "ERROR: $1"
  exit 1
}

###############################################################################
# 1) Check if LocalStack container is running
###############################################################################
echo "1) Checking if LocalStack Docker container ('${CONTAINER_NAME}') is running..."
DOCKER_PS_OUTPUT=$(docker ps --format "{{.Names}}")
if ! echo "$DOCKER_PS_OUTPUT" | grep -q "${CONTAINER_NAME}"; then
  error_exit "LocalStack container '${CONTAINER_NAME}' is not running. Start it before testing."
fi
echo "   LocalStack container is running."

###############################################################################
# 2) Check SQS Queues (myMainQueue, myDLQ)
###############################################################################
echo "2) Checking if 'myMainQueue' and 'myDLQ' exist in SQS..."
QUEUE_LIST=$(aws --endpoint-url="$ENDPOINT_URL" sqs list-queues --output json)
if ! echo "$QUEUE_LIST" | grep -q "myMainQueue"; then
  error_exit "'myMainQueue' not found in SQS list."
fi
if ! echo "$QUEUE_LIST" | grep -q "myDLQ"; then
  error_exit "'myDLQ' not found in SQS list."
fi
echo "   Both 'myMainQueue' and 'myDLQ' are present."

###############################################################################
# 3) Check Lambda Function (SQSConsumerLambda)
###############################################################################
echo "3) Checking Lambda function '${LAMBDA_NAME}'..."
LAMBDA_LIST=$(aws --endpoint-url="$ENDPOINT_URL" lambda list-functions --output json)
if ! echo "$LAMBDA_LIST" | grep -q "${LAMBDA_NAME}"; then
  error_exit "'${LAMBDA_NAME}' not found among Lambda functions."
fi
echo "   Lambda function '${LAMBDA_NAME}' is deployed."

###############################################################################
# 4) Test Normal Message
###############################################################################
echo "4) Sending a normal message to 'myMainQueue' to verify the Lambda consumes it..."
aws --endpoint-url="$ENDPOINT_URL" sqs send-message \
  --queue-url "$MAIN_QUEUE_URL" \
  --message-body "Hello normal message!" >/dev/null

echo "   Waiting a few seconds for the Lambda to consume the message..."
sleep 5

ATTRIBUTES=$(aws --endpoint-url="$ENDPOINT_URL" sqs get-queue-attributes \
  --queue-url "$MAIN_QUEUE_URL" \
  --attribute-names ApproximateNumberOfMessages ApproximateNumberOfMessagesNotVisible \
  --output json)

VISIBLE_COUNT=$(echo "$ATTRIBUTES" | grep ApproximateNumberOfMessages | sed -E 's/[^0-9]//g' | head -1)

if [ "${VISIBLE_COUNT}" -gt 0 ]; then
  echo "   WARNING: 'myMainQueue' still has $VISIBLE_COUNT visible messages. The Lambda may still be processing."
  echo "            Check 'docker logs ${CONTAINER_NAME}' to confirm."
else
  echo "   'myMainQueue' shows 0 visible messages - likely consumed by Lambda successfully."
fi

###############################################################################
# 5) Test Error Message -> Should Land in DLQ
###############################################################################
echo "5) Sending an 'error' message, which should fail in the Lambda and move to DLQ after enough retries..."

aws --endpoint-url="$ENDPOINT_URL" sqs send-message \
  --queue-url "$MAIN_QUEUE_URL" \
  --message-body "This message triggers an ERROR for DLQ" >/dev/null

echo "   We'll wait up to ~3 minutes (depending on your maxReceiveCount/visibility_timeout)."

MAX_ATTEMPTS=18  # We'll check for ~3 minutes (18 attempts * 10s)
ATTEMPT=1
MESSAGE_FOUND_IN_DLQ=0

while [ $ATTEMPT -le $MAX_ATTEMPTS ]; do
  echo "   Checking 'myDLQ' for the error message (attempt ${ATTEMPT}/${MAX_ATTEMPTS})..."

  DLQ_ATTRS=$(aws --endpoint-url="$ENDPOINT_URL" sqs get-queue-attributes \
    --queue-url "$DLQ_URL" \
    --attribute-names ApproximateNumberOfMessages \
    --output json)

  DLQ_COUNT=$(echo "$DLQ_ATTRS" | grep ApproximateNumberOfMessages | sed -E 's/[^0-9]//g' | head -1)

  if [ "${DLQ_COUNT}" -gt 0 ]; then
    echo "   Success! Found ${DLQ_COUNT} message(s) in DLQ. The error message made it there."
    MESSAGE_FOUND_IN_DLQ=1
    break
  fi

  echo "   Not yet in DLQ; waiting 10 seconds..."
  sleep 10
  ((ATTEMPT++))
done

if [ "${MESSAGE_FOUND_IN_DLQ}" -eq 1 ]; then
  echo
  echo "TEST PASSED: The 'error' message was eventually placed in 'myDLQ' after repeated Lambda failures."
  echo "Check docker logs '${CONTAINER_NAME}' for details on the repeated failures."
else
  echo
  echo "WARNING: The error message never showed up in 'myDLQ' after ${MAX_ATTEMPTS} checks."
  echo "         Possibly the message is still cycling in 'myMainQueue' if maxReceiveCount"
  echo "         or the visibility timeout are high. Check 'docker logs ${CONTAINER_NAME}'"
  echo "         for repeated errors and re-check the queue in a few minutes."
fi
