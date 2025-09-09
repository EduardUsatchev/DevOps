1. kubectl apply -f monitoring/namespace.yml
2. helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
3. helm repo add kube-state-metrics https://kubernetes.github.io/kube-state-metrics
4. helm upgrade -i prometheus prometheus-community/prometheus --namespace monitoring -f prometheus/values.yml
5. kubectl apply -f monitoring/grafana/config.yml
6. helm repo add grafana https://grafana.github.io/helm-charts
7. helm install grafana --namespace monitoring grafana/grafana --set rbac.pspEnabled=false





kubectl apply -f nginx.yaml
helm upgrade -i my-release oci://registry-1.docker.io/bitnamicharts/redis --set metrics.enabled=true
kubectl describe pod my-release-redis-master-0

node_cpu_seconds_total{cpu="0",mode="idle"}
rate(node_cpu_seconds_total[5m])
Kube-state-metrics 17519

# test
kubectl get pods -n monitoring
node_network_receive_bytes_total
node_network_receive_bytes_total{device='eth0'}
rate(node_network_receive_bytes_total{device='eth0'}[5m])
job_name: kubernetes-nodes
http://prometheus-server
kubectl apply -f nginx.yaml
