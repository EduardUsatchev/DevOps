# CloudWatch Examples README

This directory contains working examples demonstrating key Amazon CloudWatch features. Each sub‐example includes code and/or Terraform snippets to help you get hands‐on experience.

## 📂 File List

| Filename                  | Type       | Description                                                   |
|---------------------------|------------|---------------------------------------------------------------|
| **metrics_example.py**    | Python     | Publishes a custom metric (`RequestLatency`) via boto3.       |
| **metrics_cli.sh**        | Bash/CLI   | Retrieves that custom metric’s statistics using AWS CLI.     |
| **logs_example.py**       | Python     | Creates a log group & stream, then writes two log events.    |
| **logs_cli.sh**           | Bash/CLI   | Runs a CloudWatch Logs Insights query to fetch recent logs.  |
| **events_example.sh**     | Bash/CLI   | Defines an EventBridge rule for S3 “ObjectCreated” events and attaches a Lambda target. |
| **alarms_example.tf**     | Terraform  | Terraform resource to create a metric alarm on `RequestLatency`. |
| **alarms_cli.sh**         | Bash/CLI   | Creates a CPU utilization alarm on an EC2 instance via AWS CLI. |
| **dashboard_example.tf**  | Terraform  | Terraform resource to build a simple dashboard with metric & text widgets. |
| **dashboard_cli.sh**      | Bash/CLI   | Uses AWS CLI‘s `put-dashboard` to create the same dashboard. |

---



