kubectl create namespace ns-a
kubectl create namespace ns-b
kubectl apply -f pod-a.yaml
kubectl apply -f service-a.yaml
kubectl apply -f deny-ns-a-to-ns-b.yaml

kubectl apply -f pod-b.yaml
kubectl apply -f service-b.yaml
kubectl apply -f deny-ns-b-to-ns-a.yaml
kubectl apply -f test-pod-a.yaml
kubectl apply -f test-pod-b.yaml
kubectl exec -it test-pod-a -n ns-a -- curl service-b.ns-b.svc.cluster.local
kubectl exec -it test-pod-b -n ns-b -- curl service-a.ns-a.svc.cluster.local
