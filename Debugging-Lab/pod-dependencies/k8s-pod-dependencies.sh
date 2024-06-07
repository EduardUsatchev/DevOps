minikube start

#scenario 01
kubectl create namespace devops-lab
kubectl config set-context --current --namespace=devops-lab
kubectl apply -f Debugging-Lab/pod-dependencies/webapp-pod.yaml
kubectl get pod  -n devops-lab
kubectl describe pod webapp -n devops-lab
kubectl delete -f Debugging-Lab/pod-dependencies/webapp-pod.yaml
          #make changes in yaml file
kubectl apply -f Debugging-Lab/pod-dependencies/webapp-pod.yaml

#scenario 02
kubectl apply -f Debugging-Lab/pod-dependencies/mysql-deploy.yaml
kubectl describe pod mysql -n devops-lab
kubectl logs mysql -n devops-lab
          #make changes in yaml file
kubectl apply -f Debugging-Lab/pod-dependencies/mysql-svc.yaml
kubectl delete -f Debugging-Lab/pod-dependencies/webapp-pod.yaml

#scenario 03
kubectl apply -f Debugging-Lab/pod-dependencies/scenario-03/.
kubectl describe pod mysql-0 -n devops-lab
kubectl describe pod wordpress-7d8bfc4d66-hpbrv -n devops-lab

          #make changes in yaml file
kubectl apply -f Debugging-Lab/pod-dependencies/scenario-03/.
kubectl delete po mysql-0
          #make changes in yaml file
kubectl apply -f Debugging-Lab/pod-dependencies/scenario-03/.

