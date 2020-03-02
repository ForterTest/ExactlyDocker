#!/bin/bash

git clone https://github.com/ForterTest/exactly_test.git
cd exactly_test
chmod -R 777 storage
chmod -R 777 bootstrap/cache
composer install
npm install
cd ..
docker swarm init
docker build -t php_exactly php
docker stack deploy -c docker-compose.yml exactly-test
