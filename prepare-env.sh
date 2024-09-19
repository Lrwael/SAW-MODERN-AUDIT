#!/bin/bash

# Step 1: Prepare the System
# Make sure your Ubuntu system is up to date:
sudo apt update && sudo apt upgrade -y

# Step 2: Install containerd
# Install required packages:
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Install containerd:
sudo apt install containerd -y

# Configure containerd: Create a default configuration file:
sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml

# Restart containerd:
sudo systemctl restart containerd
sudo systemctl enable containerd

# Step 3: Disable Swap
# Kubernetes requires swap to be disabled:
sudo swapoff -a

# To disable swap permanently, edit /etc/fstab and comment out the swap entry.

# Step 4: Install Kubernetes (kubeadm, kubelet, kubectl)
# Add Kubernetes' official GPG key and save it to a keyring:
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

# Add the Kubernetes repository:
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update package list and install Kubernetes components:
sudo apt update
sudo apt install -y kubelet kubeadm kubectl

# Prevent them from being updated automatically:
sudo apt-mark hold kubelet kubeadm kubectl
