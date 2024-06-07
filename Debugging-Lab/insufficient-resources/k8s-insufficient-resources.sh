minikube start --cpus 2 --memory 2048
kubectl create namespace devops-lab
kubectl config set-context --current --namespace=devops-lab
kubectl apply -f Debugging-Lab/insufficient-resources/ResourceQuota.yaml
kubectl apply -f Debugging-Lab/insufficient-resources/pod-creation.yaml
kubectl get pod resource-hog -n devops-lab
kubectl describe pod resource-hog -n devops-lab
kubectl delete namespace devops-lab
minikube delete


