# Step 1: Install Kind (if not already installed)
brew install kind


# Step 2: Create the two-node cluster
kind create cluster --config kind-two-node-cluster.yaml

# Step 3: Verify the cluster is running with two nodes
kubectl get nodes


# Step 4: Deploy the DaemonSet
kubectl apply -f nginx-daemonset.yaml

# Step 5: Verify the DaemonSet and the pods
kubectl get daemonset
kubectl get pods -o wide

# Step 6: Cleanup (delete DaemonSet and Kind cluster)
kubectl delete -f nginx-daemonset.yaml
kind delete cluster
