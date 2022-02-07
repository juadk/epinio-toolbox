#!/bin/bash

figlet chartmuseum

# Variables
ETH_DEV=$(ip route | awk '/default via / { print $5 }')
MY_IP=$(ip a s ${ETH_DEV} | egrep -o 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d' ' -f2)

# Clone the Epinio Helm chart repo
git clone https://github.com/epinio/helm-charts.git

# Install chartmuseum using the gofish package manager
curl -fsSL https://raw.githubusercontent.com/fishworks/gofish/main/scripts/install.sh | bash
gofish init
gofish install chartmuseum

# We need the helm push plugin to automatically package and push chart to our repo
helm plugin install https://github.com/chartmuseum/helm-push.git
helm plugin list

# Systemd unit file to start chartmuseum in the runner
cat <<EOF | sudo tee /etc/systemd/system/chartmuseum.service
[Unit]
Description=Helm Chartmuseum
Documentation=https://chartmuseum.com/
[Service]
ExecStart=/usr/local/bin/chartmuseum \\
 --debug \\
 --port=8090 \\
 --storage="local" \\
 --storage-local-rootdir="/home/${USER}/chartstorage/"
Restart=on-failure
RestartSec=5
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start chartmuseum

# Waiting chartmuseum initialization
sleep 5

# Add our new ephemeral repo
helm repo add chartmuseum http://localhost:8090
helm repo update

# Push charts needed by epinio-installer to the repo
# We force version 0.1.0 because we don't care about versionning
# We only care about testing here
cd helm-charts/chart/
helm cm-push --version "0.1.0" epinio/ chartmuseum
helm cm-push --version "0.1.0" container-registry/ chartmuseum

# Update epinio-installer's values.yaml file for using charts hosted in our repo
sed -i -e "s|containerRegistryChart:.*|containerRegistryChart: \"http://${MY_IP}:8090/charts/container-registry-0.1.0.tgz\"|"\
       -e "s|epinioChart:.*|epinioChart: \"http://${MY_IP}:8090/charts/epinio-0.1.0.tgz\"|"\
       ../chart/epinio-installer/values.yaml

helm cm-push --version "0.1.0" epinio-installer/ chartmuseum
