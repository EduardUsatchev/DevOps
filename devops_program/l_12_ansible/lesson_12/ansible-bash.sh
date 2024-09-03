docker exec -it ansible-demo-ansible-1 bash
ssh-keygen
ssh-copy-id node1
ssh-copy-id node2
pass: screencast
git clone https://github.com/EduardUsatchev/ansible-demo
# Ad-Hoc Commands
ansible servers -m ping -i hosts
ansible servers -a "echo Hello World!" -i hosts
ansible servers -m apt -a "name=nginx state=present" -i hosts

# Hosts Inventory
cat /etc/ansible/hosts

# Variables, Tags.
ansible-playbook vars.yml -i hosts
ansible-playbook vars.yml -i hosts --tags=tag1
# Handlers, Variable register, If statement, Module, Tasks.
ansible-playbook demo.yml -i hosts

# Roles and Tasks
ansible-playbook common.yml

# Templates.
ansible-playbook template.yml
ansible-playbook template.yml -i hosts -e"my_variable=blablabla"
# Ansible Galaxy
ansible-galaxy install geerlingguy.java
ansible-playbook -i hosts -u root galaxy-role.yml


##
[servers]
node1
node2 my_variable = "haim"
my_variable = "haim"



[apps]
node1

[apps:vars]
my_variable = "haim"

[servers:vars]
my_variable = "asher"
