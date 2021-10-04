#!/bin/bash

figlet kubectl
curl -sLO https://storage.googleapis.com/kubernetes-release/release/v$1/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv kubectl /usr/local/bin
kubectl version --short --client
