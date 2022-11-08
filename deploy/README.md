# deploy

```sh
helm repo add mysql-operator https://mysql.github.io/mysql-operator/
helm repo update
helm uninstall mysql-operator --namespace mall-gf-dapr
helm install mysql-operator mysql-operator/mysql-operator  --namespace mall-gf-dapr --create-namespace
helm install mysql-innodbcluster mysql-operator/mysql-innodbcluster --namespace mall-gf-dapr--create-namespace --set credentials.root.user='root' --set credentials.root.password='12345678' --set credentials.root.host='%' --set serverInstances=3 --set routerInstances=1 --set tls.useSelfSigned=true


helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install phpmyadmin bitnami/phpmyadmin --namespace mall-gf-dapr --create-namespace

helm repo add dapr https://dapr.github.io/helm-charts/
helm repo update
helm upgrade --install dapr dapr/dapr --version=1.2 --namespace dapr-system --create-namespace --wait

kubectl apply -k deploy
kubectl apply -f deploy
kubectl create cm casdoor-config --from-file=./deploy/casdoor/app.conf --namespace mall-gf-dapr
```
