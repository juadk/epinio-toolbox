#!/bin/bash

figlet kubectl
curl --silent --location --remote-name https://storage.googleapis.com/kubernetes-release/release/v$1/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv kubectl /usr/local/bin
kubectl version --short --client
