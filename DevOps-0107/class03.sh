brew install minikube kubectl
kubectl get po
minukube start
minikube version
minikube start
kubectl get pods
kubectl get pods -o wide
docker ps
kubectl get nodes
kubectl describe node minikube
kubectl run nginx --image=nginx:1.15.12-alpine
kubectl describe pod nginx
kubectl get pod -o wide
kubectl create deployment hello-node --image=nginx:1.15.12-alpine
#hello-node1          589b6f6bb9-         prmgv
#deploymaent name     Replicate set id     pod id in replica set
kubectl scale deployment/hello-node --replicas=8
kubectl get replicaset
kubectl describe replicaset hello-node-589b6f6bb9
kubectl describe deployment hello-node
kubectl set image deployment/hello-node nginx=nginx:stable-alpine3.20
kubectl get pods -l app=hello-node
