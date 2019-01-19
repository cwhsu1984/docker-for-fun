#!/bin/bash
# migrate database and run seeder
sudo docker exec -it fpm sh -c "cd /usr/share/nginx/html/; vendor/bin/phinx migrate; vendor/bin/phinx seed:run"
