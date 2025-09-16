https://aws.amazon.com/free/?trk=99f831a2-d162-429a-9a77-a89f6b3bd6cd&sc_channel=ps&ef_id=CjwKCAjwravBBhBjEiwAIr30VFu5R1mlsoykXVOAoil2Cl4Wk9SxnhfIe7N6wNqdLRG78NHjgnWYFxoCuRkQAvD_BwE:G:s&s_kwcid=AL!4422!3!645125273267!e!!g!!aws%20free%20tier!19574556890!145779847112&gad_campaignid=19574556890&gbraid=0AAAAADjHtp9HAUr3Qr9MPPKOcorecSLOS&gclid=CjwKCAjwravBBhBjEiwAIr30VFu5R1mlsoykXVOAoil2Cl4Wk9SxnhfIe7N6wNqdLRG78NHjgnWYFxoCuRkQAvD_BwE&all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all


https://us-east-1.console.aws.amazon.com/ec2/
sudo -i 
yum install docker -y
systemctl enable docker
systemctl start docker
docker run -d -p 80:80 nginx:alpine
http://calculator.aws/
docker rm -vf container-name
https://k3s.io/
------------------------------------
curl -sfL https://get.k3s.io | sh - 
# Check for Ready node, takes ~30 seconds 
sudo k3s kubectl get node 
k3s kubectl get pods -A

alias kubectl='k3s kubectl' 
kubectl apply -f https://raw.githubusercontent.com/avielb/advanced-devops/refs/heads/master/monitoring/nginx.yaml
kubectl get pods 

# 1. List all instances
aws ec2 describe-instances \
  --filters "Name=instance-state-name,Values=running,stopped" \
  --query "Reservations[].Instances[].[InstanceId,State.Name,InstanceType,Tags[?Key=='Name']|[0].Value,PublicIpAddress]" \
  --output table

# 2. Launch a new EC2 instance
aws ec2 run-instances \
  --image-id ami-0123456789abcdef0 \
  --count 1 \
  --instance-type t3.medium \
  --key-name my-keypair \
  --security-group-ids sg-01234567 \
  --subnet-id subnet-01234567 \
  --associate-public-ip-address \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value="my-app-server"}]'

# 3. Start stopped instance(s)
aws ec2 start-instances --instance-ids i-0123456789abcdef0 i-0fedcba9876543210

# 4. Stop running instance(s)
aws ec2 stop-instances --instance-ids i-0123456789abcdef0

# 5. Reboot instance
aws ec2 reboot-instances --instance-ids i-0123456789abcdef0

# 6. Terminate instance (destructive)
aws ec2 terminate-instances --instance-ids i-0123456789abcdef0

# 7. Create an AMI from an instance
aws ec2 create-image \
  --instance-id i-0123456789abcdef0 \
  --name "my-instance-ami-$(date +%Y%m%d)" \
  --no-reboot




AmazonEC2FullAccess
-----
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0953476d60561c955" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}
