#!/bin/sh

set -e

git submodule update --init --recursive services

docker compose up -d --build
