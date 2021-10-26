#!/bin/bash

figlet Deploy GKE

gcloud container clusters create   \
  $GKE_CLUSTER_NAME                \
  --zone=$GKE_ZONE                 \
  --num-nodes=$GKE_NODE_COUNT      \
  --machine-type=$GKE_NODE_VM_SIZE \
  --disk-size=$GKE_NODE_DISK_SIZE  \
  --no-enable-cloud-monitoring     \
  --no-enable-cloud-logging        
