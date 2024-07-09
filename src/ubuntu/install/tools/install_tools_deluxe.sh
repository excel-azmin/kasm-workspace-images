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

# Install Anydesk
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk.list
apt-get update
apt-get install -y anydesk

# Install Avro Phonetic (ibus-avro)
apt-get install -y ibus-avro

# Clean up
apt-get autoremove -y
apt-get clean

# Print installation summary
echo "Installation of development packages, Anydesk, and Avro completed successfully!"
