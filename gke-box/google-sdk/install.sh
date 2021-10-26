#!/bin/bash
 
figlet google-sdk
curl --silent --location "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-$1-linux-x86_64.tar.gz" | tar xz -C .
./google-cloud-sdk/install.sh --rc-path=/home/vagrant/.profile --bash-completion=true --path-update=true --disable-installation-options
source /home/vagrant/google-cloud-sdk/path.bash.inc
gcloud version
gcloud auth activate-service-account --key-file=/home/vagrant/gcp-service-account.json --project suse-css-platform
