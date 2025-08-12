# test
new pycharm project called DevOps2402 
right click on the project and "Open In" , "Terminal"
in the terminal:
kubectl get pods 
helm list
helm create mychart
cd mychart
helm template mychart ./
helm upgrade -i myrelease ./
# change replicaCount to 3
helm upgrade -i myrelease ./
helm list
helm uninstall myrelease
# in a new file called `values-prod.yaml` write
replicaCount: 5


helm upgrade -i myrelease -f values-prod.yaml ./
helm package ./mychart
helm registry login registry-1.docker.io -u avielb
# to create a token:
https://app.docker.com/settings/personal-access-tokens
helm push mychart-0.1.0.tgz oci://registry-1.docker.io/avielb


in Chart.yaml, edit from:
version: 0.1.0
to 
version: 0.2.0

helm upgrade -i adamapp oci://registry-1.docker.io/adamlor/mychart --set replicaCount=1

helm fetch --untar  oci://registry-1.docker.io/adamlor/mychart
helm history adamapp
helm rollback adamapp
helm rollback adamapp 2
helm get values adamapp --all
helm get manifest adamapp
helm plugin install https://github.com/databus23/helm-diff

https://artifacthub.io/


helm uninstall adamapp my-release
helm lint mychart

helm diff revision myrelease 1 4
helm install my-release oci://registry-1.docker.io/bitnamicharts/redis

Chart.yaml
###########################################
apiVersion: v2
appVersion: 1.16.0
description: A Helm chart for Kubernetes
name: mychart
type: application
version: 0.2.0
dependencies:
  - name: redis
    version: 20.11.4
    repository: oci://registry-1.docker.io/bitnamicharts
###########################################

helm dep build

#Useful
helm search hub redis             # Search Artifact Hub for charts
helm search repo mychart          # Search local repos for a chart
helm show all mychart              # Show chart details (values, templates, README)
helm show values mychart           # Show only values.yaml from a chart
helm show chart mychart            # Show only Chart.yaml
helm dep update                    # Update dependencies in charts/ dir
helm dep list                      # List dependencies of a chart
helm install myrelease ./mychart --dry-run --debug   # Simulate install
helm template mychart ./ --debug                     # Render manifests
helm get notes myrelease                             # Show NOTES.txt output
helm upgrade myrelease ./mychart --set image.tag=1.21.0   # Override single value
helm upgrade myrelease ./mychart -f custom-values.yaml    # Override multiple
helm get values myrelease                                 # Show overridden values
helm get values myrelease --all                           # Show all values (incl. defaults)
helm history myrelease                 # Show release history
helm rollback myrelease 2              # Roll back to revision 2
helm status myrelease                   # Show status & resources
helm diff revision myrelease 3 5
helm uninstall myrelease           # Remove release
helm uninstall myrelease --keep-history  # Remove but keep history
helm repo remove bitnami            # Remove repo
helm repo list                      # List repos
