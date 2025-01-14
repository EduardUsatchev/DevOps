
# VPC Setup Explanation

## Step 1: Create a VPC
A Virtual Private Cloud (VPC) is the foundation of AWS networking. We start by creating a VPC with a CIDR block of `10.0.0.0/16`.

Command:
```bash
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query 'Vpc.VpcId' --output text
```

## Step 2: Create Public and Private Subnets
Subnets divide the VPC into smaller networks. We will create a public subnet (`10.0.1.0/24`) and a private subnet (`10.0.2.0/24`).

Commands:
```bash
aws ec2 create-subnet --vpc-id <vpc-id> --cidr-block 10.0.1.0/24 --query 'Subnet.SubnetId' --output text
aws ec2 create-subnet --vpc-id <vpc-id> --cidr-block 10.0.2.0/24 --query 'Subnet.SubnetId' --output text
```

## Step 3: Create an Internet Gateway and Attach to VPC
An Internet Gateway allows instances in the public subnet to access the internet.

Commands:
```bash
aws ec2 create-internet-gateway --query 'InternetGateway.InternetGatewayId' --output text
aws ec2 attach-internet-gateway --vpc-id <vpc-id> --internet-gateway-id <igw-id>
```

## Step 4: Create a Route Table and Associate with Public Subnet
A route table directs traffic within the VPC and to external networks. We create a route for all traffic (`0.0.0.0/0`) to go through the Internet Gateway.

Commands:
```bash
aws ec2 create-route-table --vpc-id <vpc-id> --query 'RouteTable.RouteTableId' --output text
aws ec2 create-route --route-table-id <route-table-id> --destination-cidr-block 0.0.0.0/0 --gateway-id <igw-id>
aws ec2 associate-route-table --route-table-id <route-table-id> --subnet-id <public-subnet-id>
```
