# copy a template file and modify to your own config
cp docker-compose.override.yml.tmp docker-compose.override.yml

# compose services
sudo docker-compose -f docker-compose.yml -f docker-compose.override.yml up -d --build

# if you modify Dockerfile, remove old services and build the new one
sudo docker stop up-api
sudo docker rm up-api
sudo docker-compose -f docker-compose.yml -f docker-compose.override.yml up -d --build
