#!/usr/bin/env bash
aws cloudwatch put-dashboard \
  --endpoint-url http://localhost:4566 \
  --dashboard-name MyApp-Dashboard \
  --dashboard-body '{
    "widgets": [
      {
        "type": "metric",
        "x": 0, "y": 0, "width": 12, "height": 6,
        "properties": {
          "metrics": [
            ["AWS/EC2","CPUUtilization","InstanceId","i-0123456789abcdef0"]
          ],
          "period": 300,
          "title": "EC2 CPU"
        }
      }
    ]
  }'
