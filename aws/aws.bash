# EC2 Commands
aws ec2 describe-instances                     # List all EC2 instances
aws ec2 start-instances --instance-ids i-0123456789abcdef0  # Start EC2 instance
aws ec2 stop-instances --instance-ids i-0123456789abcdef0   # Stop EC2 instance
aws ec2 reboot-instances --instance-ids i-0123456789abcdef0 # Reboot EC2 instance
aws ec2 terminate-instances --instance-ids i-0123456789abcdef0  # Terminate EC2 instance
aws ec2 describe-security-groups               # View EC2 security groups
aws ec2 create-key-pair --key-name MyKeyPair   # Create a new key pair
aws ec2 describe-images --owners amazon        # Describe available AMIs
aws ec2 create-snapshot --volume-id vol-0123456789abcdef0 --description "My snapshot"  # Create snapshot
aws ec2 allocate-address                       # Allocate a new Elastic IP

# IAM Commands
aws iam create-user --user-name new-user                     # Create new IAM user
aws iam list-users                                           # List all IAM users
aws iam delete-user --user-name user-to-delete               # Delete IAM user
aws iam create-access-key --user-name your-user              # Create access key for user
aws iam list-access-keys --user-name your-user               # List access keys for user
aws iam attach-user-policy --user-name your-user --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess  # Attach policy
aws iam detach-user-policy --user-name your-user --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess  # Detach policy
aws iam create-role --role-name my-role --assume-role-policy-document file://policy.json  # Create new IAM role
aws iam delete-role --role-name my-role                      # Delete IAM role
aws iam get-user --user-name your-user                       # Get details of a specific IAM user
