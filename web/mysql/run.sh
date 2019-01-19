# build mysql docker image with tag "mysql:8.0"
sudo docker build -t mysql:8.0 .

# run a container named "db" with image "mysql:8.0"
sudo docker run --name db -d \
    -p ":3306" \
    -v /home/cwhsu/docker-demo/web/mysql/datadir:/var/lib/mysql \
    --env-file .env \
    --network mynet \
    mysql:8.0
