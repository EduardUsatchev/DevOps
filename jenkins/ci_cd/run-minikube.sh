# https://medium.com/@devayanthakur/minikube-configure-jenkins-kubernetes-plugin-25eb804d0dec
kubectl apply -f account.yaml
kubectl get secrets
kubectl describe secrets/jenkins-token
cat /home/devyan/.minikube/ca.crt | base64 -w 0; echo

kubectl apply -f jenkins/ci-cd/k8s-manifests/deployment.yaml
kubectl port-forward service/flask-app-service 8080:80

kubectl apply -f jenkins-k8s-config.yaml
kubectl get secret $(kubectl get serviceaccount jenkins-sa -o jsonpath='{.secrets[0].name}') -o jsonpath='{.data.token}' | base64 --decode
docker run -p 5000:80 flask-app
doc