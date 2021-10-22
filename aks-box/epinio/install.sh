#/bin/bash

figlet epinio
curl --silent --output epinio -L https://github.com/epinio/epinio/releases/download/v$1/epinio-linux-amd64
chmod +x epinio
mv epinio /usr/local/bin
