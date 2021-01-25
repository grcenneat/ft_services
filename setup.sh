minikube start --driver=virtualbox
eval $(minikube docker-env)

#metallb
MINIKUBE_IP=$(minikube ip)
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" srcs/metallb/metallb-config.yaml > ./srcs/metallb/metallb.yaml
minikube addons enable metallb
kubectl apply -f ./srcs/metallb/metallb.yaml

# nginx
cd ./srcs/nginx
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./nginx-config.yaml > ./nginx.yaml
echo "\033[32mnginx image build\033[0m"
docker build -t nginx:latest .
kubectl apply -f ./nginx.yaml

# mysql
cd ../mysql
echo "\033[32mmysql image build\033[0m"
docker build -t mysql:latest .
echo "\033[36mmysql deployment\033[0m"
kubectl apply -f mysql.yaml

# phpmyadmin
cd ../phpmyadmin
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./phpmyadmin-config.yaml > ./phpmyadmin.yaml
echo "phpmyadmin image build"
docker build -t phpmyadmin:latest .
echo "phpmyadmin deployment"
kubectl apply -f phpmyadmin.yaml

# wordpress
cd ../wordpress
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./wordpress-config.yaml > ./wordpress.yaml
echo "\033[32mwordpress image build\033[0m"
docker build -t wordpress:latest .
echo "\033[36mwordpress deployment\033[0m"
kubectl apply -f wordpress.yaml