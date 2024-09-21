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
KUBERNETES_VERSION=1.29
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v$KUBERNETES_VERSION/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v$KUBERNETES_VERSION/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Add the Kubernetes repository:
# Replace <codename> with your Ubuntu codename (e.g., focal for 20.04, jammy for 22.04)

# Update package list and install Kubernetes components:
sudo apt update
sudo apt install -y kubelet kubeadm kubectl

# Prevent them from being updated automatically:
sudo apt-mark hold kubelet kubeadm kubectl
