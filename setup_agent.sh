#!/bin/bash

set -e

echo "Setting up Azure DevOps self-hosted agent..."

# Update system
sudo apt update -y

# Install basic tools if not present
if ! command -v unzip &> /dev/null; then
    echo "Installing unzip..."
    sudo apt-get install unzip -y
fi

if ! command -v wget &> /dev/null; then
    echo "Installing wget..."
    sudo apt-get install wget -y
fi

# Install Python if not present
if ! command -v python3 &> /dev/null; then
    echo "Installing Python3..."
    sudo apt install python3 python3-pip -y
fi

# Install Ansible if not present
if ! command -v ansible &> /dev/null; then
    echo "Installing Ansible..."
    sudo apt install ansible -y
else
    echo "Ansible is already installed."
fi

# Install Terraform if not present
if ! command -v terraform &> /dev/null; then
    echo "Installing Terraform..."
    wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install terraform -y
else
    echo "Terraform is already installed."
fi

# Install AWS CLI if not present
if ! command -v aws &> /dev/null; then
    echo "Installing AWS CLI..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    rm -rf aws awscliv2.zip
else
    echo "AWS CLI is already installed."
fi

echo "Setup complete!"
