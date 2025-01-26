#!/bin/bash

# Update package index and install Docker if not already installed
echo "Installing Docker..."
sudo apt update
sudo apt install -y docker.io

# Start and enable Docker service
echo "Starting Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

# Verify Docker installation
echo "Docker version:"
docker --version

# Pull the official Ubuntu image
echo "Pulling Ubuntu image..."
docker pull ubuntu

# Run an Ubuntu container interactively
echo "Running Ubuntu container interactively..."
docker run -it --name ubuntu_interactive ubuntu

# Optional: Run a detached Ubuntu container
echo "Running Ubuntu container in detached mode..."
docker run -d --name ubuntu_detached ubuntu

# List running containers
echo "Listing running containers..."
docker ps

# Optional: Access the running container
echo "Accessing the interactive container..."
docker exec -it ubuntu_interactive bash

# Optional: Stop and remove containers
echo "Stopping and removing containers..."
docker stop ubuntu_interactive ubuntu_detached
docker rm ubuntu_interactive ubuntu_detached

# Optional: Run Ubuntu with a volume for persistent data
echo "Running Ubuntu container with volume..."
docker run -it -v $(pwd)/data:/data --name ubuntu_with_volume ubuntu

# Commit changes to create a custom Ubuntu image
echo "Creating a custom Ubuntu image from the interactive container..."
docker commit ubuntu_interactive my_custom_ubuntu

echo "All done!"
