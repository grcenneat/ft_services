minikube start --driver=virtualbox
eval $(minikube docker-env)

#metallb
MINIKUBE_IP=$(minikube ip)
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" srcs/metallb/metallb-config.yaml > ./srcs/metallb/metallb.yaml
minikube addons enable metallb
kubectl apply -f ./srcs/metallb/metallb.yaml

# nginx
cd ./srcs/nginx
echo "\033[32mnginx image build\033[0m"
docker build -t nginx:latest .
kubectl apply -f ./nginx.yaml