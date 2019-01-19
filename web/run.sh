#!/bin/bash
sudo docker-compose -f docker-compose.yml -f docker-compose.override.yml down
sudo rm -rf mysql/datadir/
sudo docker-compose -f docker-compose.yml -f docker-compose.override.yml up -d --build
echo "wait for db init to prepare db data"
sleep 20
./fpm/migrate.sh
