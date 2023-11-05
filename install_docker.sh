#!/bin/bash

# Update the apt package index
sudo apt-get update -y

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker apt repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y

# Update the apt package index again
sudo apt-get update -y

# Install the latest version of Docker CE
sudo apt-get install -y docker-ce

# Add the current user to the Docker group
sudo usermod -aG docker $USER

# Apply the new group membership
newgrp docker

# Test Docker
docker run hello-world
