#!/bin/bash
# manage_apt.sh
# A simple script to manage APT package operations

# Update package list
echo "Updating package lists..."
sudo apt update

# Upgrade existing packages
echo "Upgrading installed packages..."
sudo apt upgrade -y

# Install curl as an example
echo "Installing curl..."
sudo apt install -y curl

# Clean up unused packages
echo "Cleaning up..."
sudo apt autoremove -y
sudo apt clean

echo "APT management operations completed."
