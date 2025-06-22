import boto3
import datetime
import os

cw = boto3.client(
    "cloudwatch",
    endpoint_url=os.getenv("AWS_ENDPOINT_URL", "http://localhost:4566"),
    region_name="us-east-1"
)

response = cw.put_metric_data(
    Namespace="MyApp/Service",
    MetricData=[
        {
            "MetricName": "RequestLatency",
            "Dimensions": [
                {"Name": "ServiceName", "Value": "OrderAPI"}
            ],
            "Timestamp": datetime.datetime.utcnow(),
            "Value": 150.0,
            "Unit": "Milliseconds"
        },
    ]
)
print("PutMetricData response:", response)
