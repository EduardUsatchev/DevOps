# Run provisioning playbook
ansible-playbook -i hosts provisioning.yml

# Run configuration management playbook
ansible-playbook -i hosts configuration_management.yml

# Run continuous deployment playbook
ansible-playbook -i hosts continuous_deployment.yml

# Run security compliance playbook
ansible-playbook -i hosts security_compliance.yml

# Run disaster recovery playbook
ansible-playbook -i hosts disaster_recovery.yml
