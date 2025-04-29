#!/bin/bash

cd /home/ubuntu/<your-app-directory>  # Change to app directory

# Build Docker image
sudo docker build -t app-container .

# Stop and remove the existing container if it exists
if sudo docker ps -a --format '{{.Names}}' | grep -Eq '^app-container$'; then
  echo "Stopping and removing existing app-container..."
  sudo docker stop app-container
  sudo docker rm app-container
fi

# Run the new container
sudo docker run -d --name app-container -p 3000:3000 app-container

# Optional: clean up unused images
sudo docker image prune -f
