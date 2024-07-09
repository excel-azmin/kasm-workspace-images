#!/usr/bin/env bash
set -ex

# Update package lists
apt-get update

# Install basic tools
apt-get install -y \
    vlc \
    git \
    zip \
    unzip \
    tmux \
    curl \
    wget \
    build-essential \
    software-properties-common

# Install programming languages
# Python
apt-get install -y python3 python3-pip python3-venv

# # Install Docker
# apt-get install -y apt-transport-https ca-certificates gnupg-agent software-properties-common
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"
# apt-get update
# apt-get install -y docker-ce docker-ce-cli containerd.io
# usermod -aG docker $USER

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Load NVM and install Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Install and set default Node.js version to 18
nvm install 18
nvm use 18
nvm alias default 18

# Clean up
apt-get autoremove -y
apt-get clean

# Print installation summary
echo "Installation of development packages completed successfully!"
