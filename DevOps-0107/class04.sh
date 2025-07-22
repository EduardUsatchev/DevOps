kubectl expose deploy/hello-node --type NodePort --port 80
https://kubernetes.io/docs/reference/kubectl/generated/kubectl_completion/
kubectl expose deploy/hello-node --type LoadBalancer --port 80
kubectl delete pod nginx
kubectl apply -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/pod-with-service.yaml
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/refs/heads/master/guestbook/cronjob.yaml


