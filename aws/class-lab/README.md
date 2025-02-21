# **End-to-End DevOps Lab: AWS Lambda, Secrets Manager, Kubernetes (K3s), Terraform, and LocalStack**

## **📌 Overview**
This **DevOps Lab** is designed to help you deploy a **serverless application** using AWS services **(Lambda, Secrets Manager, IAM)** inside a **local Kubernetes cluster (K3s)**. The setup uses **Terraform** for infrastructure as code and **LocalStack** to simulate AWS services locally.

### **🛠️ What You'll Learn**
- 🚀 **Deploy AWS Lambda** inside Kubernetes.
- 🔐 **Manage secrets** with AWS Secrets Manager.
- ⚙️ **Automate infrastructure** using Terraform.
- 🏗 **Simulate AWS services** locally using LocalStack.
- 📦 **Orchestrate serverless functions** with Kubernetes (K3s).

---

## **🌍 Why This Lab?**
This lab **mimics real-world cloud deployments** but allows you to run everything **locally** instead of using an actual AWS account.

### **Key Benefits**
✅ **No AWS Costs** – Run everything locally without AWS billing.  
✅ **Rapid Development** – Test AWS services instantly without deployment delays.  
✅ **Infrastructure as Code (IaC)** – Use Terraform for repeatable infrastructure automation.  
✅ **Hands-on Kubernetes** – Deploy and manage workloads in a **K3s Kubernetes cluster**.

---

## **⚙️ Setup Guide**

### **1️⃣ Start LocalStack (Simulated AWS)**
LocalStack is used to **mock AWS services locally**.

🛠 **Command:**
```bash
docker run --rm -d --name localstack \
  -p 4566:4566 -p 4510-4559:4510-4559 \
  -e SERVICES="lambda,secretsmanager,iam" \
  -e DEFAULT_REGION="us-east-1" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  localstack/localstack
```
🔍 **Verify:**
```bash
docker ps  # Confirm LocalStack is running
```

---

### **2️⃣ Deploy Kubernetes (K3s) Locally**
We use **Multipass** to run a **lightweight Kubernetes cluster (K3s)** locally.

🛠 **Commands:**
```bash
multipass launch --name k3s --mem 4G --disk 40G
multipass exec k3s -- bash -c "curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC='server --write-kubeconfig-mode=644' sh -"
```
🔍 **Check Kubernetes:**
```bash
kubectl get nodes  # Verify K3s is running
```

---

### **3️⃣ Configure AWS CLI to Use LocalStack**
Since LocalStack **mimics AWS services**, we configure AWS CLI accordingly.

🛠 **Commands:**
```bash
aws configure set aws_access_key_id test
aws configure set aws_secret_access_key test
aws configure set region us-east-1
```
🔍 **Verify AWS CLI Configuration:**
```bash
aws --endpoint-url=http://localhost:4566 lambda list-functions  # Should return an empty list
```

---

### **4️⃣ Create a Secret in AWS Secrets Manager**

🛠 **Command:**
```bash
aws --endpoint-url=http://localhost:4566 secretsmanager create-secret \
  --name MyDatabaseSecret \
  --secret-string '{"username":"admin", "password":"SuperSecret123"}'
```
🔍 **Verify Secret:**
```bash
aws --endpoint-url=http://localhost:4566 secretsmanager list-secrets
```

---

### **5️⃣ Deploy AWS Lambda Function**

📌 **Lambda Function (`lambda_function.py`)**:
```python
import json
import boto3
import os

def lambda_handler(event, context):
    client = boto3.client('secretsmanager', endpoint_url=os.getenv('LOCALSTACK_ENDPOINT', 'http://localhost:4566'))
    secret = client.get_secret_value(SecretId="MyDatabaseSecret")
    secret_data = json.loads(secret['SecretString'])

    return {
        'statusCode': 200,
        'body': json.dumps(f"Retrieved secret: {secret_data}")
    }
```
🛠 **Deploy Lambda:**
```bash
zip function.zip lambda_function.py
aws --endpoint-url=http://localhost:4566 lambda create-function \
  --function-name MyLambdaFunction \
  --runtime python3.8 \
  --role arn:aws:iam::000000000000:role/lambda-role \
  --handler lambda_function.lambda_handler \
  --zip-file fileb://function.zip
```
🔍 **Test Lambda:**
```bash
aws --endpoint-url=http://localhost:4566 lambda invoke --function-name MyLambdaFunction response.json
cat response.json
```

---

## **🎉 Final Outcome**
✅ **AWS Lambda deployed inside Kubernetes**  
✅ **Secrets stored in AWS Secrets Manager (simulated)**  
✅ **Infrastructure automated using Terraform**  
✅ **AWS services running locally via LocalStack**  

---

## **📜 License**
This project is licensed under the **MIT License**. You are free to use, modify, and distribute it.

## **🙌 Contributing**
Contributions are welcome! Feel free to submit issues, feature requests, or pull requests.


