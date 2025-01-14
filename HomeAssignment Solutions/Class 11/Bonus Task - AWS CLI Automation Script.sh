
#!/bin/bash
# Script to automate launching an EC2 instance, attaching EBS volume, and allocating Elastic IP.

# Launch EC2 instance
aws ec2 run-instances --image-id ami-12345678 --count 1 --instance-type t2.micro --key-name ec2-key --security-group-ids sg-12345678 --subnet-id subnet-12345678

# Create and attach EBS volume
aws ec2 create-volume --availability-zone us-east-1a --size 5 --volume-type gp2
aws ec2 attach-volume --volume-id vol-12345678 --instance-id i-12345678 --device /dev/xvdf

# Allocate and associate Elastic IP
aws ec2 allocate-address
aws ec2 associate-address --instance-id i-12345678 --public-ip <elastic-ip>
    