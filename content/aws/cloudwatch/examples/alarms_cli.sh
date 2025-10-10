#!/usr/bin/env bash
aws cloudwatch put-metric-alarm \
  --endpoint-url http://localhost:4566 \
  --alarm-name HighCPU \
  --metric-name CPUUtilization \
  --namespace AWS/EC2 \
  --statistic Average \
  --period 300 \
  --threshold 80 \
  --comparison-operator GreaterThanThreshold \
  --dimensions Name=InstanceId,Value=i-0123456789abcdef0 \
  --evaluation-periods 1 \
  --alarm-actions arn:aws:sns:us-east-1:000000000000:ops-alerts
