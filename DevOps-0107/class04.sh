https://kubernetes.io/
http://kubernetes.io/docs/reference/kubectl/generated/kubectl_completion/
kubectl create deployment hello-node --image=nginx:1.15.12-alpine
kubectl expose deploy/hello-node --type CLusterIP --port 80
kubectl get svc
kubectl get pods -l app=hello-node
kubectl describe svc hello-node
kubectl expose deploy/hello-node --type NodePort --port 80
kubectl get svc hello-node -o yaml
kubectl patch svc hello-node -p '{"spec": {"type": "ClusterIP"}}'
kubectl edit svc hello-node
kubectl get svc
kubectl get pods
curl https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/pod-with-service.yaml
https://www.pulumi.com/
 
https://kubernetes.io/docs/reference/kubectl/generated/kubectl_completion/

kubectl expose deploy/hello-node --type LoadBalancer --port 80
kubectl delete pod nginx
kubectl apply -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/pod-with-service.yaml
https://crontab.guru/
kubectl apply -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/guestbook/cronjob.yaml

kubectl get pods 
kubectl apply -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/volumes/pv.yaml
kubectl apply -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/volumes/pvc.yaml
kubectl describe persistentvolumeclaim/task-pv-claim
kubectl apply -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/volumes/pod-with-pvc.yaml
kubectl exec -it task-pv-pod -- bash
cd usr/share/nginx/html/
echo 1 > index.html
exit
kubectl debug node/docker-desktop -it --image=busybox -- sh
kubectl delete -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/volumes/pod-with-pvc.yaml
kubectl apply -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/volumes/pod-with-pvc.yaml
kubectl apply -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/volumes/pod-empty-dir.yaml
kubectl apply -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/volumes/config-map.yaml
kubectl apply -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/volumes/game-config.yaml
kubectl apply -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/volumes/pod-with-config-map.yaml
kubectl exec -it pod-env-var -- bash
cat /app/game.properties
exit
kubectl describe configmap game-config
kubectl apply -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/volumes/secret.yaml
kubectl apply -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/volumes/pod-with-secret.yaml
https://github.com/bitnami-labs/sealed-secrets
https://www.akeyless.io/
https://www.hashicorp.com/en/products/vault
https://external-secrets.io/latest/
https://fluxcd.io/flux/guides/mozilla-sops/
kubectl delete -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/volumes/statefulset.yaml
kubectl apply -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/volumes/statefulset.yaml
kubectl apply -f https://raw.githubusercontent.com/EduardUsatchev/k8s-demo/refs/heads/master/volumes/daemonset.yaml

