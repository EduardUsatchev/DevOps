#!/usr/bin/env bash
aws cloudwatch get-metric-statistics \
  --endpoint-url http://localhost:4566 \
  --namespace MyApp/Service \
  --metric-name RequestLatency \
  --start-time 2025-06-22T12:00:00Z \
  --end-time   2025-06-22T13:00:00Z \
  --period 60 \
  --statistics Average
