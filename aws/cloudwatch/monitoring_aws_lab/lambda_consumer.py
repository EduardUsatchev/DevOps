import json

def handler(event, context):
    for record in event.get('Records', []):
        print(f"Consumed SQS message: {record['body']}")
    return {"status": "processed"}
