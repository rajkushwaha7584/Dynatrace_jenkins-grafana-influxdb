#!/bin/bash
set -e

sudo apt update
sudo apt install -y docker.io docker-compose-v2

sudo systemctl enable docker
sudo systemctl start docker

docker --version
docker compose version
