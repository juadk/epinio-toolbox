#!/bin/bash

figlet helm
curl -sLO https://get.helm.sh/helm-v$1-linux-amd64.tar.gz
tar -zxf helm-*
sudo mv linux-amd64/helm /usr/local/bin
helm version
