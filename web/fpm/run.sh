# build php-fpm docker image with tag "fpm:7.2"
sudo docker build -t fpm:7.2 .

# user defined network
sudo docker network create mynet

# run a container named "fpm" with image "fpm:7.2"
sudo docker run --name fpm -d \
    -p ":9000" \
    -v /home/cwhsu/docker-demo/app:/usr/share/nginx/html \
    --network mynet \
    fpm:7.2

echo waiting for db to migrate data
sleep 20
./migrate.sh
