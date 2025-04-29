#!/bin/bash

cd /home/ubuntu/app

# Pull latest changes (optional if CodeDeploy synced already)
git pull origin main

# Build and run Docker container
sudo docker build -t app-container .
sudo docker stop app-container || true
sudo docker rm app-container || true
sudo docker run -d -p 3000:3000 --name app-container app-container
