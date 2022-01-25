#!/bin/bash

figlet k3s
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=$1 sh -
sudo chmod +r /etc/rancher/k3s/k3s.yaml
