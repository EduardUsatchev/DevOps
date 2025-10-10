#Setting Up ArgoCD (20 minutes)
#
#Prerequisites:
#
#A running Kubernetes cluster (Minikube, Kind, or a managed service like GKE, EKS, or AKS).
#
#A Git repository containing Kubernetes manifests.
#
#Installation Steps:
#
#Create a namespace for ArgoCD:
#
#kubectl create namespace argocd
#
#Install ArgoCD using the official manifest:

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

#Accessing the ArgoCD UI:
#Forward the ArgoCD API server to a local port:

kubectl port-forward svc/argocd-server -n argocd 8080:443

#Open https://localhost:8080 in a browser and log in using the default credentials.