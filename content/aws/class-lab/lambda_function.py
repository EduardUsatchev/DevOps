import json
import boto3
import os

def lambda_handler(event, context):
    localstack_endpoint = f"http://{os.getenv('LOCALSTACK_HOSTNAME', 'host.docker.internal')}:4566"
    sqs_client = boto3.client('sqs', endpoint_url=localstack_endpoint)
    queue_url = os.getenv("SQS_QUEUE_URL", "http://localhost:4566/000000000000/MyQueue")

    print("🟢 Receiving messages from SQS...")
    response = sqs_client.receive_message(QueueUrl=queue_url, MaxNumberOfMessages=1, WaitTimeSeconds=5)

    if 'Messages' in response:
        for message in response['Messages']:
            print(f"📩 Received message: {message['Body']}")
            # Delete the message after processing
            sqs_client.delete_message(QueueUrl=queue_url, ReceiptHandle=message['ReceiptHandle'])
            print("✅ Message processed and deleted.")

    return {"statusCode": 200, "body": json.dumps("Lambda executed successfully")}
