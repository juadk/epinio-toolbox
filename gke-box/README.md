# GKE box

Before deploying, make sure to customize the deployment with the variables within the [env.yml](https://github.com/juadk/epinio-toolbox/blob/main/gke-box/env.yml) file.</br>
Your gcloud credentials must be filled as a service-account with the name gcp-service-account.json in the root path.

Once done, start the deployment with `vagrant up`.</br>
Then, you should be able to login into the VM with `vagrant ssh` and create the GKE cluster:

```
gcloud container clusters create   \
  $GKE_CLUSTER_NAME                \
  --zone=$GKE_ZONE                 \
  --num-nodes=$GKE_NODE_COUNT      \
  --machine-type=$GKE_NODE_VM_SIZE \
  --disk-size=$GKE_NODE_DISK_SIZE  \
  --no-enable-cloud-monitoring     \
  --no-enable-cloud-logging
```

You can also choose to automatically create the cluster with vagrant by setting the env `provision_gke` to `true` in the [env file](./env.yml).

For deleting the cluster, execute this command: </br>
`gcloud container clusters delete $GKE_CLUSTER_NAME --zone=$GKE_ZONE`

For deleting the VM, execute this command: </br>
`vagrant destroy`
