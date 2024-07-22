minikube start -p eduard --cni calicoc
kubectl apply -f pod-a.yaml
kubectl apply -f pod-b.yaml
kubectl apply -f pod-c.yaml
kubectl apply -f deny-all-to-pod-a.yaml
kubectl apply -f allow-pod-b-to-pod-c.yaml
kubectl apply -f allow-pod-c-to-pod-b-on-ports.yaml
kubectl get pods
kubectl get networkpolicies
kubectl exec -it pod-b -- curl pod-a
kubectl exec -it pod-b -- curl pod-c
kubectl exec -it pod-c -- curl pod-b:80
kubectl exec -it pod-c -- curl pod-b:8080
kubectl exec -it pod-c -- curl pod-b:9090
