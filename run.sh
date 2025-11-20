#!/bin/sh

set -e

docker compose down

docker compose up -d --build

# datahub migrate db
docker compose exec dataverse-datahub php artisan migrate --force

# dataview migrate db
docker compose exec dataverse-dataview php artisan migrate --force

# datacore migrate db
docker compose exec dataverse-datacore bun run db:migrate
