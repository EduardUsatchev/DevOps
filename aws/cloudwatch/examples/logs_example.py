import boto3, time

logs = boto3.client("logs", endpoint_url="http://localhost:4566")

# Create group & stream
logs.create_log_group(logGroupName="MyAppLogs")
logs.create_log_stream(logGroupName="MyAppLogs", logStreamName="stream1")

# Put log events
events = [
    {"timestamp": int(time.time() * 1000), "message": "Starting process"},
    {"timestamp": int(time.time() * 1000), "message": "Process completed"}
]
response = logs.put_log_events(
    logGroupName="MyAppLogs",
    logStreamName="stream1",
    logEvents=events
)
print("PutLogEvents:", response)
