import json
import boto3
import os

def lambda_handler(event, context):
    try:
        print("🟢 Connecting to AWS Secrets Manager...")

        localstack_endpoint = f"http://{os.getenv('LOCALSTACK_HOSTNAME', 'host.docker.internal')}:4566"
        secret_name = "MyDatabaseSecret"  # Ensure this matches the secret created

        client = boto3.client('secretsmanager', endpoint_url=localstack_endpoint)

        # Verify secret exists
        print(f"🔍 Checking if secret '{secret_name}' exists...")
        secrets_list = client.list_secrets()
        existing_secrets = [s["Name"] for s in secrets_list.get("SecretList", [])]

        if secret_name not in existing_secrets:
            raise Exception(f"Secret '{secret_name}' does not exist!")

        # Retrieve secret
        secret = client.get_secret_value(SecretId=secret_name)
        secret_data = json.loads(secret['SecretString'])

        print("✅ Successfully retrieved secret.")

        return {
            'statusCode': 200,
            'body': json.dumps(f"Retrieved secret: {secret_data}")
        }

    except Exception as e:
        print(f"❌ Error: {str(e)}")
        return {
            'statusCode': 500,
            'body': json.dumps(f"Error: {str(e)}")
        }

