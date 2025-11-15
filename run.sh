#!/bin/sh

set -e

git submodule update --init --recursive services

docker compose up -d --build

# datahub migrate db
docker-compose exec dataverse-datahub php artisan migrate --force

# dataview migrate db
docker-compose exec dataverse-dataview php artisan migrate --force
