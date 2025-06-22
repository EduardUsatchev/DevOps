import json
import time
import random
import boto3
import os

# SQS client pointing at LocalStack
sqs = boto3.client(
    'sqs',
    endpoint_url=os.getenv('AWS_ENDPOINT_URL', 'http://localhost:4566')
)
QUEUE_URL = os.getenv('QUEUE_URL', 'http://localhost:4566/000000000000/lab-sqs-queue')

def handler(event, context):
    # Structured log of incoming event
    log = {"timestamp": int(time.time()), "event": event}
    print(json.dumps(log))

    # Randomly throw an error for alarm testing
    if random.choice([True, False]):
        raise Exception("Intentional error for CloudWatch alarm")

    # Simulate work
    start = time.time()
    time.sleep(random.uniform(0.5, 1.5))
    duration_ms = (time.time() - start) * 1000
    print(json.dumps({"duration_ms": duration_ms}))

    # Push to SQS
    sqs.send_message(QueueUrl=QUEUE_URL, MessageBody=json.dumps({
        "event": event,
        "duration_ms": duration_ms
    }))

    return {"status": "ok"}
