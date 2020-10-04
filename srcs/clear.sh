cd metalLB
kubectl delete -f metallb-config.yaml > /dev/null
cd ..
echo   "\033[1;34m[MetalLB deleted]\033[m"

cd nginx
kubectl delete -f nginx.yaml > /dev/null
cd ..
echo   "\033[1;34m[nginx deleted]\033[m"

cd ftps
kubectl delete -f ftps.yaml > /dev/null
cd ..
echo   "\033[1;34m[FTPS deleted]\033[m"

cd MySQL
kubectl delete -f mysql.yaml > /dev/null
cd ..
echo   "\033[1;34m[MySQL deleted]\033[m"

cd phpMyadmin
kubectl delete -f phpmyadmin.yaml > /dev/null
sleep 15
cd ..
echo   "\033[1;34m[phpMyadmin deleted]\033[m"

cd Wordpress
kubectl delete -f wordpress.yaml > /dev/null
cd ..
sleep 15
echo   "\033[1;34m[Wordpress deleted]\033[m"

cd influxdb
kubectl delete -f influxdb.yaml > /dev/null
cd ..
echo   "\033[1;34m[influxdb deleted]\033[m"

cd telegraf
kubectl delete -f telegraf.yaml > /dev/null
cd ..
echo   "\033[1;34m[telegraf deleted]\033[m"

cd grafana
kubectl delete -f grafana.yaml > /dev/null
cd ..
echo   "\033[1;34m[grafana deleted]\033[m"

sleep 20
echo   "\033[1;37m(ﾉ◕ヮ◕)ﾉ*:・ﾟ✧ Everything clear\033[m"