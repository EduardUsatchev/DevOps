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

#Network
kubectl expose deployment/hello-node --type=ClusterIP --port=80
kubectl run tmp-shell --rm -i --tty --image nicolaka/netshoot
kubectl patch svc hello-node -p '{"spec": {"type": "NodePort"}}'
kubectl describe service hello-node
kubectl delete svc hello-node
kubectl expose deployment/hello-node --type=NodePort --port=80
kubectl get endpoints

#HPA
kubectl autoscale deployment hello-node --cpu-percent=50 --min=1 --max=10

#Declerative
git clone https://github.com/EduardUsatchev/k8s-demo.git
kubectl apply -f pod-with-service.yaml
kubectl delete -f pod-with-service.yaml
kubectl describe svc fe-gate
kubectl apply -f ./

minikube dashboard


#Exercise
1. kubectl run mysql-pod --image=mysql:latest --port=3306
2.


