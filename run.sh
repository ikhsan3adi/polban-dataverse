#!/bin/sh

set -e

cp .env.example .env

git submodule update --init --recursive

docker compose up -d --build
