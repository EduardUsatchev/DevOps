#!/usr/bin/env bash
# Create EventBridge rule for S3 uploads
aws events put-rule \
  --endpoint-url http://localhost:4566 \
  --name OnS3Upload \
  --event-pattern '{
    "source": ["aws.s3"],
    "detail-type": ["Object Created"],
    "detail": { "bucket": { "name": ["lab-s3-bucket"] } }
  }'

# Attach Lambda as target
aws events put-targets \
  --endpoint-url http://localhost:4566 \
  --rule OnS3Upload \
  --targets "Id"="1","Arn"="arn:aws:lambda:us-east-1:000000000000:function:lab_lambda_producer"
