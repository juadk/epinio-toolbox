#!/bin/bash

AWS_PREFIX=$(echo $1 | awk '{print tolower($0)}')
AWS_RANDOM=$(mktemp -u aXXXXX | awk '{print tolower($0)}')

cat >>/home/vagrant/.bashrc<<EOF
AWS_EKS_CLUSTER_NAME=$AWS_PREFIX-$AWS_RANDOM-epinio
AWS_REGION=$2"
AWS_EKS_NODE_COUNT=$3
AWS_EKS_NODE_VM_SIZE=$4
AWS_EKS_NODE_DISK_SIZE=$5
AWS_SSH_KEY=$6
AWS_EKS_KUBECONFIG=
KUBECONFIG=

