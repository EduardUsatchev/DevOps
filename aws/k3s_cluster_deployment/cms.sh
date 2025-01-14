
#!/bin/bash

# Step 1: Update and install necessary packages
sudo apt update
sudo apt install -y curl docker.io

# Step 2: Install K3s on master node
curl -sfL https://get.k3s.io | sh -

# Step 3: Retrieve node token
NODE_TOKEN=$(sudo cat /var/lib/rancher/k3s/server/node-token)
echo "Node token: $NODE_TOKEN"

# Step 4: Instructions for joining agent nodes
echo "To join agent nodes, run the following command on each agent:"
echo "curl -sfL https://get.k3s.io | K3S_URL=https://<master-ip>:6443 K3S_TOKEN=$NODE_TOKEN sh -"

# Step 5: Deploy the Python application
kubectl apply -f deployment.yaml

# Step 6: Verify deployment
kubectl get nodes
kubectl get svc



#Step 3: Build and Push the Docker Image

docker build -t my-python-app:latest .
docker tag my-python-app:latest <your-dockerhub-username>/my-python-app:latest
docker push <your-dockerhub-username>/my-python-app:latest

kubectl apply -f deployment.yaml

#Step 6: Access the Application

#Find the external IP of the service

kubectl get svc python-app-service

Access the application via http://<external-ip>/hello.
