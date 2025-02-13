sops -e -i secrets.yaml
helm plugin install https://github.com/jkroepke/helm-secrets
helm secrets upgrade --install myapp ./mychart -f values.yaml -f secrets.yaml
