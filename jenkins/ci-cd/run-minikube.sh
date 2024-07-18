# https://medium.com/@devayanthakur/minikube-configure-jenkins-kubernetes-plugin-25eb804d0dec
kubectl apply -f account.yaml
kubectl get secrets
kubectl describe secrets/jenkins-token
cat /home/devyan/.minikube/ca.crt | base64 -w 0; echo

kubectl apply -f jenkins/ci-cd/k8s-manifests/deployment.yaml
kubectl port-forward service/flask-app-service 8080:80
