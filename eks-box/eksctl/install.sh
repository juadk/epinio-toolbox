#!/bin/bash
 
figlet eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C .
chmod +x eksctl
sudo mv eksctl /usr/local/bin
eksctl version
