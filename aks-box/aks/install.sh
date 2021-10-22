#!/bin/bash

figlet Deploy AKS

az group create          \
  --name $RESOURCE_GROUP \
  --location $REGION

echo "NOTE: the following AKS warning is 'normal', as we have auto-generated the SSH keys."
az aks create                        \
  --resource-group $RESOURCE_GROUP   \
  --name $CLUSTER_NAME               \
  --node-vm-size $NODE_VM_SIZE       \
  --node-count $NODE_COUNT           \
  --node-osdisk-size $NODE_DISK_SIZE \
  --generate-ssh-keys

echo "NOTE: the following AKS warning is 'normal', it is here just to inform that the kubeconfig file has been modified."
az aks get-credentials               \
  --resource-group $RESOURCE_GROUP   \
  --name $CLUSTER_NAME               \
  --file $KUBECONFIG
