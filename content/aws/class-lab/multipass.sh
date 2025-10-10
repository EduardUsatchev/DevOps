#!/bin/bash

# Multipass Useful Commands Documentation

## Basic Multipass Commands
# List all running and stopped instances
multipass list

# Launch a new instance (Example: Ubuntu VM with 4GB RAM, 40GB Disk)
multipass launch --name myvm --memory 4G --disk 40G

# Stop a running instance
multipass stop myvm

# Start a stopped instance
multipass start myvm

# Delete an instance (must be stopped first)
multipass delete myvm

# Permanently remove deleted instances
multipass purge

## Networking & Configuration
# Get the IP address of an instance
multipass info myvm | grep IPv4

# Execute a command inside an instance
multipass exec myvm -- uname -a

# Open a shell inside the instance
multipass shell myvm

## File Management
# Transfer a file from host to instance
multipass transfer myfile.txt myvm:/home/ubuntu/

# Transfer a file from instance to host
multipass transfer myvm:/home/ubuntu/myfile.txt ./

## Advanced Usage
# Mount a local directory into an instance
multipass mount /Users/yourfolder myvm:/mnt/shared

# Unmount a directory
multipass unmount myvm:/mnt/shared

# Create a snapshot of an instance
multipass snapshot myvm

# Restore an instance from a snapshot
multipass restore myvm

# Clean up unused images
multipass recover

## Debugging & Logs
# Check system logs for Multipass
multipass list --format yaml
multipass version
journalctl -u multipassd --no-pager | tail -50

# Restart Multipass service
multipass stop --all
multipass restart

# Reset Multipass completely (Caution: Deletes all instances)
multipass stop --all
multipass delete --all
multipass purge
