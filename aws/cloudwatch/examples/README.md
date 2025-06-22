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

## 🔧 Prerequisites

- Docker & LocalStack (if targeting local)  
- AWS CLI v2 (`brew install awscli` or official installer)  
- Python 3 + boto3 (`pip3 install boto3`)  
- Terraform ≥ 1.0 (for `.tf` examples)  
- `zip` / `unzip` (if packaging Lambdas)  

All CLI commands assume the `--endpoint-url http://localhost:4566` flag when running against LocalStack.

---

## ▶️ How to Use

1. **Clone this repo** or **unzip** the examples folder.  
2. **Make shell scripts executable**:
   ```bash
   chmod +x examples/*.sh
Run Python examples:

bash
Copy
Edit
# metrics_example.py
python3 examples/metrics_example.py

# logs_example.py
python3 examples/logs_example.py
Run CLI examples:

bash
Copy
Edit
examples/metrics_cli.sh
examples/logs_cli.sh
examples/events_example.sh
examples/alarms_cli.sh
examples/dashboard_cli.sh
Apply Terraform examples:

bash
Copy
Edit
cd examples
terraform init
terraform apply -auto-approve alarms_example.tf
terraform apply -auto-approve dashboard_example.tf
📘 Example Descriptions
1. metrics_example.py & metrics_cli.sh
Python: Sends a single datapoint to MyApp/Service → RequestLatency.

CLI: Fetches the average latency over a fixed window.

2. logs_example.py & logs_cli.sh
Python:

Creates log group MyAppLogs and stream stream1.

Writes two timestamped messages.

CLI: Runs an Insights query to list the 10 most recent messages.

3. events_example.sh
CLI:

Defines a rule OnS3Upload matching S3 “ObjectCreated”.

Routes matching events to a Lambda function (lab_lambda_producer).

4. alarms_example.tf & alarms_cli.sh
Terraform: Creates a CloudWatch metric alarm “High-Request-Latency” on our custom latency metric.

CLI: Defines a CPU utilization alarm for EC2 via put-metric-alarm.

5. dashboard_example.tf & dashboard_cli.sh
Terraform: Builds a dashboard named MyApp-Dashboard containing:

A metric widget showing RequestLatency for OrderAPI.

A text widget with a markdown header.

CLI: Uses put-dashboard with equivalent JSON to create the same dashboard.

📝 Notes
When testing locally with LocalStack, append --endpoint-url http://localhost:4566 to all aws commands.

Adjust timestamps, ARNs, or resource names to suit your environment when running against real AWS.

You can mix & match these snippets to explore composite alarms, metric math, or advanced Insights queries.
