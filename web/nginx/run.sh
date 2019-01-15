# build nginx docker image with tag "nginx:0.1"
sudo docker build -t nginx:0.1 .

# run a container named "myweb" with image "nginx:0.1" on localhost:8080
sudo docker run --name myweb -d -p 8080:80 \
    --network mynet -d nginx:0.1
