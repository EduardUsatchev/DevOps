#!/usr/bin/env bash
set -e

# Disable AWS CLI pager so output isn’t sent to less
export AWS_PAGER=""

AWS="aws --endpoint-url=http://localhost:4566"

echo "🔍 Checking SQS queue..."
$AWS sqs get-queue-url --queue-name lab-sqs-queue

echo "🚀 Invoking producer Lambda..."
echo '{}' > /tmp/event.json
$AWS lambda invoke \
  --function-name lab_lambda_producer \
  --payload file:///tmp/event.json \
  /tmp/output.txt
cat /tmp/output.txt

echo "✉️ Sending test message to SQS..."
QURL=$($AWS sqs get-queue-url --queue-name lab-sqs-queue --query 'QueueUrl' --output text)
$AWS sqs send-message --queue-url "$QURL" --message-body '{"test":"hello"}'

echo "📈 Fetching SQS metrics..."
START_TIME=$(python3 - << 'EOF'
import datetime
print((datetime.datetime.utcnow() - datetime.timedelta(minutes=5))
      .strftime("%Y-%m-%dT%H:%M:00Z"))
EOF
)
END_TIME=$(python3 - << 'EOF'
import datetime
print(datetime.datetime.utcnow()
      .strftime("%Y-%m-%dT%H:%M:00Z"))
EOF
)
$AWS cloudwatch get-metric-statistics \
  --namespace AWS/SQS \
  --metric-name ApproximateNumberOfMessagesVisible \
  --dimensions Name=QueueName,Value=lab-sqs-queue \
  --start-time "$START_TIME" \
  --end-time   "$END_TIME" \
  --period 60 --statistics Average

echo "📊 Listing CloudWatch Dashboards..."
$AWS cloudwatch list-dashboards --dashboard-name-prefix Lab-Monitoring-Dashboard

echo "📊 Retrieving dashboard details..."
$AWS cloudwatch get-dashboard --dashboard-name Lab-Monitoring-Dashboard

echo "✅ Verification complete!"
