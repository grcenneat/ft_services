minikube start --driver=virtualbox
eval $(minikube docker-env)

#metallb
minikube addons enable metallb
kubectl apply -f ./srcs/metallb/metallb.yaml

# nginx
cd ./srcs/nginx
echo "\033[32mnginx image build\033[0m"
docker build -t nginx:latest .	> /dev/null
echo "\033[36mnginx deployment\033[0m"
kubectl apply -f ./nginx-secret.yaml
kubectl apply -f ./nginx.yaml

# mysql
cd ../mysql
echo "\033[32mmysql image build\033[0m"
docker build -t mysql:latest .	> /dev/null
echo "\033[36mmysql deployment\033[0m"
kubectl apply -f mysql.yaml

# phpmyadmin
cd ../phpmyadmin
echo "\033[32mphpmyadmin image build\033[0m"
docker build -t phpmyadmin:latest .	> /dev/null
echo "\033[36mphpmyadmin deployment\033[0m"
kubectl apply -f phpmyadmin.yaml

# wordpress
cd ../wordpress
echo "\033[32mwordpress image build\033[0m"
docker build -t wordpress:latest . > /dev/null
echo "\033[36mwordpress deployment\033[0m"
kubectl apply -f wordpress.yaml

# ftps
cd ../ftps
echo "\033[32mftps image build\033[0m"
docker build -t ftps:latest .	> /dev/null
echo "\033[36mftps deployment\033[0m"
kubectl apply -f ftps.yaml

# influxdb
cd ../influxdb
echo "\033[32minfluxdb image build\033[0m"
docker build -t influxdb:latest .	> /dev/null
echo "\033[36minfluxdb deployment\033[0m"
kubectl apply -f influxdb.yaml

# telegraf
cd ../telegraf
echo "\033[32mtelegraf image build\033[0m"
docker build -t telegraf:latest . > /dev/null
echo "\033[36mtelegraf deployment\033[0m"
kubectl apply -f telegraf.yaml

# grafana
cd ../grafana
echo "\033[32mgrafana image build\033[0m"
docker build -t grafana:latest . > /dev/null
echo "\033[36mgrafana deployment\033[0m"
kubectl apply -f grafana.yaml