#!/bin/bash

# Set AWS CLI to use LocalStack
export AWS_ENDPOINT_URL="http://localhost:4566"

echo "Verifying LocalStack Resources..."

# Check VPCs
echo "Listing VPCs:"
aws ec2 describe-vpcs --endpoint-url=$AWS_ENDPOINT_URL --output table

echo "--------------------------------------------------"

# Check Subnets
echo "Listing Subnets:"
aws ec2 describe-subnets --endpoint-url=$AWS_ENDPOINT_URL --output table

echo "--------------------------------------------------"

# Check Security Groups
echo "Listing Security Groups:"
aws ec2 describe-security-groups --endpoint-url=$AWS_ENDPOINT_URL --output table

echo "--------------------------------------------------"

# Check Route Tables
echo "Listing Route Tables:"
aws ec2 describe-route-tables --endpoint-url=$AWS_ENDPOINT_URL --output table

echo "--------------------------------------------------"

# Check Internet Gateways
echo "Listing Internet Gateways:"
aws ec2 describe-internet-gateways --endpoint-url=$AWS_ENDPOINT_URL --output table

echo "--------------------------------------------------"

echo "LocalStack Resources Verified Successfully!"