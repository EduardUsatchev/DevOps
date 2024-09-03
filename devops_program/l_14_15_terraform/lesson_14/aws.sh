sudo su -
yum install docker
systemctl enable docker
systemctl start docker
docker run -d -p 80:80 nginx:alpine

#Terraform
git clone https://github.com/EduardUsatchev/tf-demo.git
cd ex1
edit ami
terraform init
terraform apply
terraform destroy
terraform apply -var-file myvars.tfvars