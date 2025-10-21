import json
import os

def lambda_handler(event, context):
    # TODO implement
    print("moshe")
    print(event)
    print(os.environ)
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!'),
        'event': event
    }
---------------------------------------------------------
import boto3
import os
from botocore.exceptions import ClientError

def get_secret(secret_name):
    """
    Retrieve the value of a secret from AWS Secrets Manager.
    :param secret_name: The name or ARN of the secret.
    :return: Secret value (String or Binary).
    """
    # Initialize the boto3 client for Secrets Manager
    client = boto3.client('secretsmanager')
    
    try:
        # Call Secrets Manager to retrieve the secret value
        response = client.get_secret_value(SecretId=secret_name)
        
        # Secrets Manager response contains either 'SecretString' or 'SecretBinary'
        if 'SecretString' in response:
            return response['SecretString']
        else:
            # If the secret is binary, decode it
            return response['SecretBinary']
    
    except ClientError as e:
        print(f"Error retrieving secret: {e}")
        return None

def lambda_handler(event, context):
    
    # Get the secret content
    secret_value = get_secret("credentials")
    
    if secret_value:
        print(f"Secret retrieved successfully: {secret_value}")
        # Process the secret (e.g., database password, API keys, etc.)
        return {
            'statusCode': 200,
            'body': f"Secret retrieved: {secret_value[:50]}"  # Just printing the first 50 chars for security
        }
    else:
        return {
            'statusCode': 500,
            'body': 'Failed to retrieve the secret.'
        }
--------------------------------------------
import os
import json
import boto3
from decimal import Decimal

TABLE_NAME = os.environ.get("TABLE_NAME", "students")
REGION = os.environ.get("AWS_REGION", "us-east-2")

dynamodb = boto3.resource("dynamodb", region_name=REGION)
table = dynamodb.Table(TABLE_NAME)

class DecimalEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, Decimal):
            # Convert Decimals to float or int as appropriate
            return float(o) if (o % 1) else int(o)
        return super().default(o)

def lambda_handler(event, context):
    try:
        items = []
        scan_kwargs = {}
        while True:
            resp = table.scan(**scan_kwargs)
            items.extend(resp.get("Items", []))
            lek = resp.get("LastEvaluatedKey")
            if not lek:
                break
            scan_kwargs["ExclusiveStartKey"] = lek

        return {
            "statusCode": 200,
            "body": json.dumps(
                {"message": f"Fetched {len(items)} items from DynamoDB.", "items": items},
                cls=DecimalEncoder
            ),
            "headers": {"Content-Type": "application/json"}
        }

    except Exception as e:
        # Helpful logging for IAM/region issues
        print(f"[ERROR] {e}")
        return {
            "statusCode": 500,
            "body": json.dumps({"message": "Error fetching data from DynamoDB", "error": str(e)})
        }
