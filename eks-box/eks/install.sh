#!/bin/bash

figlet Deploy EKS

eksctl create cluster                        \
  --name=$AWS_EKS_CLUSTER_NAME               \
  --region=$AWS_REGION                       \
  --nodes=$AWS_EKS_NODE_COUNT                \
  --node-type=$AWS_EKS_NODE_VM_SIZE          \
  --node-volume-size=$AWS_EKS_NODE_DISK_SIZE \
  --ssh-access                               \
  --ssh-public-key $AWS_SSH_KEY              \
  --managed                                  \
  --kubeconfig=$AWS_EKS_KUBECONFIG
