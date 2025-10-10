
# RDS Setup Explanation

## Step 1: Create an RDS Instance
We create an RDS instance using the MySQL engine with 20GB of storage.

Command:
```bash
aws rds create-db-instance \
    --db-instance-identifier mydbinstance \
    --db-instance-class db.t3.micro \
    --engine mysql \
    --allocated-storage 20 \
    --master-username admin \
    --master-user-password password123 \
    --vpc-security-group-ids <sg-id>
```

## Step 2: Configure Security Group for RDS
Ensure the security group attached to the RDS instance allows inbound traffic on port 3306 (MySQL).

Command:
```bash
aws ec2 authorize-security-group-ingress \
    --group-id <sg-id> \
    --protocol tcp \
    --port 3306 \
    --cidr 0.0.0.0/0
```

## Step 3: Connect to the RDS Instance
Once the RDS instance is available, use the endpoint provided by AWS to connect.

Command to connect using MySQL client:
```bash
mysql -h <rds-endpoint> -u admin -p
```
