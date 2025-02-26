Below is an **updated** `README.md` for your LocalStack SQS + Lambda DevOps Lab. It provides context for what the lab does, dependencies, setup steps, how to run the test script, and instructions for cleanup. You can place this file in the root of your repository or in the same folder as your scripts.

---

# LocalStack SQS + Lambda DevOps Lab

This repository demonstrates how to create and test a **serverless** application using **AWS Lambda** and **Amazon SQS**—all running **locally** via **LocalStack**. The lab sets up:

- A **main SQS queue** (`myMainQueue`)  
- A **Dead-Letter Queue (DLQ)** (`myDLQ`) with a redrive policy  
- A **Lambda function** (`SQSConsumerLambda`) that processes messages from `myMainQueue`  
- An **event source mapping** (SQS → Lambda)  
- **Terraform** for Infrastructure as Code  
- **Docker-based** Lambda execution in LocalStack

You’ll send both **normal** and **error** messages to illustrate how messages get processed or, in the case of repeated failures, moved to the DLQ.

---

## Prerequisites

1. **Docker**  
   - Ensure Docker is installed and running on your system.  
   - Required for LocalStack and Docker-based Lambda execution.
2. **Terraform**  
   - Version 1.0 or later recommended.
3. **AWS CLI**  
   - Version 2 recommended (for testing messages, listing queues, etc.).
4. **Bash** or a compatible shell (if on Windows, use WSL or Git Bash).

---

## Files Overview

- **`setup_localstack_sqs_lambda.sh`**  
  - Spins up LocalStack (with Docker-mounted Lambda executor).  
  - Creates a “localstack-lab” directory.  
  - Generates a Terraform config (`main.tf`) and a simple Python-based Lambda function (`app.py`).  
  - Runs `terraform init && terraform apply -auto-approve` to create SQS queues, Lambda function, and an event source mapping.  
  - Sends a **normal** message and an **error** message to the queue to demonstrate functionality.

- **`test_localstack_sqs_lambda.sh`**  
  - Validates the setup by:  
    1. Checking if the LocalStack container is running.  
    2. Ensuring `myMainQueue` & `myDLQ` exist.  
    3. Checking if the `SQSConsumerLambda` function is deployed.  
    4. Sending a **normal** message and confirming the queue goes empty (Lambda consumed it).  
    5. Sending an **error** message and waiting to see it arrive in `myDLQ` after repeated failures.

- **`README.md`** (this file)  
  - Explains the purpose, prerequisites, usage, and cleanup instructions for the lab.

---

## Usage

1. **Clone** this repository or download the scripts.

2. **Make the scripts executable** (on Linux/macOS):
   ```bash
   chmod +x setup_localstack_sqs_lambda.sh
   chmod +x test_localstack_sqs_lambda.sh
   ```

3. **Run the setup script**:
   ```bash
   ./setup_localstack_sqs_lambda.sh
   ```
   - This script will:
     1. Stop and remove any existing `localstack_dev` container.
     2. Start a new LocalStack container with the Docker socket mounted (so Lambdas can run in Docker).
     3. Create the `localstack-lab` folder with a Python Lambda and Terraform config.
     4. Run `terraform init && terraform apply -auto-approve`.
     5. Send two messages to `myMainQueue`: one normal and one containing `"error"`.

   - **Output**: You should see logs indicating successful creation of SQS queues and a Lambda function. The script ends by printing instructions for further checks.

4. **Verify** in Docker logs:
   ```bash
   docker logs localstack_dev
   ```
   - Look for lines about **CreateFunction**, **EventSourceMapping**, and messages being processed by the Lambda.

5. **Run the test script**:
   ```bash
   ./test_localstack_sqs_lambda.sh
   ```
   - Confirms everything is working.  
   - Checks that the normal message was consumed.  
   - Waits until the error message appears in `myDLQ` after failing in the Lambda enough times.

6. **(Optional) Inspect the DLQ**:
   ```bash
   aws --endpoint-url=http://localhost:4566 \
     sqs receive-message \
     --queue-url http://localhost:4566/000000000000/myDLQ
   ```
   - You’ll see the “error” message body if it has arrived.

---

## Adjusting Timeouts / Retries

- **maxReceiveCount** (in `main.tf`) determines how many times SQS retries a failing message before sending it to the DLQ.  
- **visibility_timeout_seconds** affects how long a message remains invisible after each failed delivery to the Lambda.  
- The **test script** (`test_localstack_sqs_lambda.sh`) has time intervals (sleep durations, max attempts) to wait and check for the failing message in `myDLQ`. Adjust these to match your chosen queue settings.

---

## Cleanup

When you’re done experimenting:

1. **Stop and remove** the LocalStack container:
   ```bash
   docker stop localstack_dev && docker rm localstack_dev
   ```
2. **Destroy** Terraform-managed resources:
   ```bash
   cd localstack-lab
   terraform destroy -auto-approve
   ```
3. (Optional) **Remove** the `localstack-lab` folder or archive it if you’d like to keep the code/terraform plan.

---

## Troubleshooting

- **Docker not available**: If you see an error about “Docker not available” when creating the Lambda, ensure you mounted `/var/run/docker.sock` and set `DOCKER_HOST="unix:///var/run/docker.sock"`.
- **STS credential issues**: If you get `InvalidClientTokenId`, confirm your Terraform config includes the `skip_credentials_validation` flags and the STS endpoint pointing to LocalStack.
- **Message never arriving in DLQ**: Wait longer or lower your `maxReceiveCount` / `visibility_timeout_seconds` so the message fails more quickly.

---
