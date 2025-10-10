import json

def lambda_handler(event, context):
    for record in event.get('Records', []):
        body = record['body']
        print(f"[Lambda] Received message: {body}")

        # Force an error if the message contains "error" to demonstrate DLQ usage
        if "error" in body.lower():
            raise ValueError("Forcing an error to test DLQ behavior!")

    return {
        "statusCode": 200,
        "body": json.dumps("Messages processed successfully")
    }
