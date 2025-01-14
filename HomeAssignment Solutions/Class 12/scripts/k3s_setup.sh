
#!/bin/bash

# Install K3s on master node
curl -sfL https://get.k3s.io | sh -

# Get node token
NODE_TOKEN=$(sudo cat /var/lib/rancher/k3s/server/node-token)
echo "Node token: $NODE_TOKEN"

# Command to join agent nodes (run this on each agent node)
echo "curl -sfL https://get.k3s.io | K3S_URL=https://<MASTER_IP>:6443 K3S_TOKEN=$NODE_TOKEN sh -"
