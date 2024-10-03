#!/bin/bash

echo "[Starting deploy setup]"

echo "Updating and upgrating Linux system..."
sudo apt update && sudo apt upgrade –y

echo "Installing dependencies.."
sudo apt install docker.io
docker --version
sudo systemctl start docker
sudo systemctl enable docker
sudo apt get install docker-compose
docker-compose --version

echo "Cloning the project..."
sudo git clone https://www.github.com/datasane/datasane-app.git
cd datasane-app
sudo docker-compose up --build




