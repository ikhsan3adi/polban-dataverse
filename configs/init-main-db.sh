#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL

    -- Initialize kong database
    DO \$\$
    BEGIN
       IF NOT EXISTS (
          SELECT FROM pg_catalog.pg_roles
          WHERE rolname = '${KONG_DB_USER}') THEN

          CREATE USER ${KONG_DB_USER} WITH PASSWORD '${KONG_DB_PASSWORD}';
       END IF;
    END \$\$;

    CREATE DATABASE ${KONG_DB_NAME} WITH OWNER = ${KONG_DB_USER};

EOSQL
