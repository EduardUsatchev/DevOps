minikube docker-env
eval $(minikube -p minikube docker-env)
minikube image ls --format table
docker build -t app .

minikube image load app
kubectl run app --image=app --image-pull-policy=Never --restart=Never
kubectl logs app
kubectl delete pod app

#fixed
kubectl run app-fixed --image=app --image-pull-policy=Never --restart=Never