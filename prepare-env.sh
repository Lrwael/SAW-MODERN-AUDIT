#/bin/bash

#Step 1: Prepare the System
#Make sure your Ubuntu system is up to date:

sudo apt update && sudo apt upgrade -y

#Step 2: Install containerd
#Install required packages:

sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

#Install containerd:

sudo apt install containerd -y

#Configure containerd: Create a default configuration file:

sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml

#Restart containerd:

sudo systemctl restart containerd
sudo systemctl enable containerd

#Step 3: Disable Swap
#Kubernetes requires swap to be disabled:

sudo swapoff -a

##To disable swap permanently, edit /etc/fstab and comment out the swap entry.

#Step 4: Install Kubernetes (kubeadm, kubelet, kubectl)
#Add Kubernetes’ official GPG key:

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

#Add the Kubernetes repository:

sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

#Install Kubernetes components:

sudo apt install -y kubelet kubeadm kubectl

#Prevent them from being updated automatically:

sudo apt-mark hold kubelet kubeadm kubectl
