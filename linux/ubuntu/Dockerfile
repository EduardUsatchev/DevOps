FROM ubuntu:latest

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install systemd and necessary packages
RUN apt-get update && \
    apt-get install -y systemd systemd-sysv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Mark systemd directories as volumes to persist data if needed
VOLUME [ "/sys/fs/cgroup" ]

# Start systemd as the container's init system
CMD ["/sbin/init"]
