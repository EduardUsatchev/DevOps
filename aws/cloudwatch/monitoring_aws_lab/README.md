# Lab: Monitoring AWS Services with CloudWatch (LocalStack)

## 🕒 Duration  
3 hours

## 🎯 Goal  
Hands-on observability: metrics, logs, events, alarms, and dashboards for Lambda, SQS, and S3—entirely on LocalStack.

---

## 📋 Table of Contents

1. [Overview & Architecture](#overview--architecture)  
2. [Flow Diagram](#flow-diagram)  
3. [Prerequisites](#prerequisites)  
4. [Lab File Structure](#lab-file-structure)  
5. [Setup & Deployment](#setup--deployment)  
6. [Lab Parts & Manual](#lab-parts--manual)  
   - Part 1: CloudWatch Concepts  
   - Part 2: Lambda Monitoring  
   - Part 3: SQS Monitoring  
   - Part 4: S3 Monitoring  
   - Part 5: End-to-End Pipeline & Dashboard  
7. [Verification](#verification)  
8. [Cleanup](#cleanup)  
9. [Next Steps & Exercises](#next-steps--exercises)

---

## Overview & Architecture

This lab demonstrates how to:

- Deploy AWS services (Lambda, SQS, S3, SNS) locally with Terraform  
- Instrument them with CloudWatch metrics, logs, alarms, and dashboards  
- Trigger, monitor, and alert on real-time events—all using LocalStack

Services run in LocalStack container; Terraform targets `localhost:4566`.

---

## Flow Diagram

```mermaid
flowchart LR
    subgraph LocalStack
      S3["S3 Bucket<br/>(lab-s3-bucket)"] 
      Producer["Producer Lambda<br/>(lab_lambda_producer)"]
      SQS["SQS Queue<br/>(lab-sqs-queue)"]
      Consumer["Consumer Lambda<br/>(lab_lambda_consumer)"]
      SNS["SNS Topic<br/>(lab-alerts-topic)"]
    end

    S3 -- ObjectCreated --> Producer
    Producer -- SendMessage --> SQS
    SQS -- EventSourceMapping --> Consumer
    Consumer -- PublishConfirmation --> SNS

    %% CloudWatch overlays
    Producer -->|Metrics & Logs| CloudWatch
    SQS      -->|Metrics| CloudWatch
    S3       -->|Metrics & AccessLogs| CloudWatch
    SNS      -->|Alerts| CloudWatch
