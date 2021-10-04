#/bin/bash

figlet epinio
curl --silent -o epinio -L https://github.com/epinio/epinio/releases/download/v$1/epinio-linux-amd64
sudo chmod +x epinio
sudo mv epinio /usr/local/bin
