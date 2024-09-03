kubectl apply -f pv.yaml
kubectl describe pv task-pv-volume
kubectl get storageclass
kubectl apply -f pvc.yaml
kubectl describe pv pvc-1bf1ab63-a9a8-495a-b412-3bb82ba726a5
kubectl apply -f pod-with-pvc.yaml
kubectl exec -it task-pv-pod -- bash
cd /usr/share/nginx/html
echo hello > 1.txt
kubectl get pvc
kubectl get pv pvc-1bf1ab63-a9a8-495a-b412-3bb82ba726a5 -o yaml

minikube ssh
ls -ltr /tmp/hostpath-provisioner/default/task-pv-claim
kubectl delete -f pod-with-pvc.yaml
kubectl apply -f pod-with-pvc.yaml
kubectl exec -it task-pv-pod -- bash
cd /usr/share/nginx/html
ls -la

kubectl apply -f config-map.yaml
kubectl describe configmap example-configmap
kubectl create configmap game-config --from-file=configs/
cat pod-with-config-map.yaml
kubectl apply -f pod-with-config-map.yaml
kubectl exec -it pod-env-var -- bash
cd app
cat ui.properties
cat game.properties

kubectl exec -it pod-env-var -- bash
env
env | grep uri


helm
helm install my-release oci://registry-1.docker.io/bitnamicharts/nginx
kubectl get pods
kubectl get deploy
kubectl get svc
helm upgrade -i my-release oci://registry-1.docker.io/bitnamicharts/nginx --set replicaCount=3
helm upgrade -i my-release oci://registry-1.docker.io/bitnamicharts/nginx --set replicaCount=3 --set service.type=ClusterIP
helm delete my-release
helm upgrade -i my-release oci://registry-1.docker.io/bitnamicharts/nginx -f ../helm/values-prod.yaml
helm rollback my-release
helm list
helm create wog
vim _helpers.tpl
helm template my-release ./ --debug
helm upgrade -i my-app ./
helm pull oci://registry-1.docker.io/bitnamicharts/nginx --untar