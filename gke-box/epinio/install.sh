#/bin/bash

figlet epinio
curl --silent --output epinio --location https://github.com/epinio/epinio/releases/download/v$1/epinio-linux-x86_64
sudo chmod +x epinio
sudo mv epinio /usr/local/bin
