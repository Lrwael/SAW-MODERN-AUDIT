#!/bin/bash
# Note: can also just install nerdctl-full

sudo apt-get update
sudo apt-get install containerd

wget https://github.com/containerd/nerdctl/releases/download/v1.5.0/nerdctl-1.5.0-linux-amd64.tar.gz
tar -zxf nerdctl-1.5.0-linux-amd64.tar.gz nerdctl
sudo mv nerdctl /usr/bin/nerdctl
rm nerdctl-1.5.0-linux-amd64.tar.gz

wget https://github.com/containernetworking/plugins/releases/download/v1.3.0/cni-plugins-linux-amd64-v1.3.0.tgz
sudo mkdir -p /opt/cni/bin/
sudo tar -zxf cni-plugins-linux-amd64-v1.3.0.tgz -C /opt/cni/bin/
rm cni-plugins-linux-amd64-v1.3.0.tgz

# https://github.com/moby/buildkit for building images
wget https://github.com/moby/buildkit/releases/download/v0.12.2/buildkit-v0.12.2.linux-amd64.tar.gz
tar -zxvf buildkit-v0.12.2.linux-amd64.tar.gz
sudo mv bin/* /usr/bin/
rm buildkit-v0.12.2.linux-amd64.tar.gz
