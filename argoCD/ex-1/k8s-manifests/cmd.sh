argocd app create my-app \
  --repo https://github.com/user/repo.git \
  --path k8s-manifests \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace default

argocd app sync my-app

argocd app rollback my-app --revision <commit-hash>

argocd app create helm-app \
  --repo https://charts.helm.sh/stable \
  --helm-chart nginx \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace default
