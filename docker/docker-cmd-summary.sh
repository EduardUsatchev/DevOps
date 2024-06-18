# Images
docker build -t image_name:tag .                 # Build an image from Dockerfile
docker images                                   # List all Docker images
docker rmi image_name:tag                        # Remove Docker image

# Containers
docker run -d -p host_port:container_port --name container_name image_name:tag  # Run a container
docker ps                                       # List running containers
docker ps -a                                    # List all containers (including stopped)
docker stop container_id/container_name         # Stop a container
docker start container_id/container_name        # Start a stopped container
docker restart container_id/container_name      # Restart a container
docker rm container_id/container_name           # Remove a container
docker inspect container_id/container_name      # Inspect container details
docker exec -it container_id/container_name command  # Execute a command in a running container

# Networks and Volumes
docker network ls                               # List Docker networks
docker network create network_name              # Create a Docker network
docker volume ls                                # List Docker volumes
docker volume create volume_name                # Create a Docker volume

# Logs and Executions
docker logs container_id/container_name         # View logs from a container
docker attach container_id/container_name       # Attach to container's STDOUT/STDERR
docker exec -it container_id/container_name command  # Execute a command in a container

# Registry and Authentication
docker login registry_url                       # Login to a Docker registry
docker push image_name:tag                      # Push an image to a Docker registry
docker pull image_name:tag                      # Pull an image from a Docker registry

# System and Info
docker version                                  # Display Docker version
docker info                                     # Display Docker system info
docker system prune                             # Clean up Docker resources (containers, images, volumes, networks)
