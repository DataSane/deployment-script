#!/bin/bash

echo "[Starting deploy setup]"

echo "Updating and upgrading Linux system..."
sudo apt update && sudo apt upgrade -y

echo "Installing dependencies..."
sudo apt install -y docker.io docker-compose

docker --version
docker-compose --version

sudo systemctl start docker
sudo systemctl enable docker

echo "Cloning the project..."
git clone https://www.github.com/datasane/datasane-app.git
cd datasane-app

read -p "Enter AWS Access Key ID: " AWS_ACCESS_KEY_ID
read -p "Enter AWS Secret Access Key: " AWS_SECRET_ACCESS_KEY
read -p "Enter AWS Region: " AWS_REGION

echo "Starting Docker Compose..."
sudo -E env "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" "AWS_REGION=$AWS_REGION" docker-compose up --build
