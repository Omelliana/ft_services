# Start minikube
minikube --driver=virtualbox start

# Point shell to minikube's docker-daemon
eval $(minikube docker-env)

# Enable statistics
minikube addons enable metrics-server

# Dashboard
echo  "\033[1;96mStart Dashboard]\033[m"
minikube dashboard &
sleep 20

# Install MetalLB
cd srcs/metalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml > /dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml > /dev/null

# Create a secret for encrypted speaker communication
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null
kubectl apply -f metallb-config.yaml > /dev/null
echo  "\033[1;33m[MetalLB installed]\033[m"

# NGINX
cd ../nginx
docker build -t nginx-image . > /dev/null
echo  "\033[1;33m[nginx image builded]\033[m"
kubectl apply -f nginx.yaml > /dev/null
echo  "\033[1;33m[nginx deployment]\033[m"

# FTPS
cd ../ftps
docker build -t ftps-image . > /dev/null
echo  "\033[1;33m[FTPS image builded]\033[m"
kubectl apply -f ftps.yaml > /dev/null
echo  "\033[1;33m[FTPS deployment]\033[m"

# MySQL
cd ../MySQL
docker build -t mysql-image . > /dev/null
echo  "\033[1;33m[MySQL image builded]\033[m"
kubectl apply -f mysql.yaml > /dev/null
sleep 5
echo  "\033[1;33m[MySQL deployment]\033[m"

# phpMyAdmin
cd ../phpMyAdmin
docker build -t phpmyadmin-image . > /dev/null
echo  "\033[1;33m[phpMyAdmin image builded]\033[m"
kubectl apply -f phpmyadmin.yaml > /dev/null
echo  "\033[1;33m[phpMyAdmin deployment]\033[m"

# Wordpress
cd ../Wordpress
docker build -t wordpress-image . > /dev/null
echo  "\033[1;33m[Wordpress image builded]\033[m"
sleep 10
kubectl apply -f wordpress.yaml > /dev/null
echo  "\033[1;33m[Wordpress deployment]\033[m"

# Influxdb
cd ../influxdb
docker build -t influxdb-image . > /dev/null
echo  "\033[1;33m[influxdb image builded]\033[m"
kubectl apply -f influxdb.yaml > /dev/null
echo  "\033[1;33m[influxdb deployment]\033[m"

# Telegraf
cd ../telegraf
docker build -t telegraf-image . > /dev/null
echo  "\033[1;33m[telegraf image builded]\033[m"
kubectl apply -f telegraf.yaml > /dev/null
echo  "\033[1;33m[telegraf deployment]\033[m"

# Grafana
cd ../grafana
docker build -t grafana-image . > /dev/null
echo  "\033[1;33m[grafana image builded]\033[m"
sleep 10
kubectl apply -f grafana.yaml > /dev/null
echo  "\033[1;33m[grafana deployment]\033[m"

echo  "\033[1;32mEvetyhing done...\n
Opening site °˖✧◝(⁰▿⁰)◜✧˖°\033[m"
open https://192.168.99.100
