#!/bin/bash
 
figlet aws-auth
curl --silent --output aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/$1/2021-07-05/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
sudo mv aws-iam-authenticator /usr/local/bin
aws-iam-authenticator version
