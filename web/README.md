# copy a template file and modify to your own config
cp docker-compose.override.yml.tmp docker-compose.override.yml

# compose services
sudo docker-compose -f docker-compose.yml -f docker-compose.override.yml up -d --build

# if you modify Dockerfile, remove old services and build the new one
sudo docker stop NAME/ID
sudo docker rm NAME/ID
sudo docker-compose -f docker-compose.yml -f docker-compose.override.yml up -d --build
