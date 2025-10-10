#!/usr/bin/env bash
aws logs start-query \
  --endpoint-url http://localhost:4566 \
  --log-group-name MyAppLogs \
  --start-time $(date -u -d '-1h' '+%s') \
  --end-time $(date -u '+%s') \
  --query-string 'fields @timestamp, @message | sort @timestamp desc | limit 10'

# Fetch results:
# aws logs get-query-results --endpoint-url http://localhost:4566 --query-id <QUERY_ID>
