# AKS box

Before deploying, make sure to customize the deployment with the variables within the [env.yml](./env.yml) file.</br>
Your aws credentials must be filled in the `secrets.yml` file. Rename the template file [secrets.yml-template](./secrets.yml-template) to `secrets.yml` and change the values according your needs.

Once done, start the deployment with `vagrant up`.</br>
Then, you should be able to login into the VM with `vagrant ssh` and create the AKS cluster:

```
az aks create                        \
  --resource-group $RESOURCE_GROUP   \
  --name $CLUSTER_NAME               \
  --node-vm-size $NODE_VM_SIZE       \
  --node-count $NODE_COUNT           \
  --node-osdisk-size $NODE_DISK_SIZE \
  --generate-ssh-keys
```

You can also choose to automatically create the cluster with vagrant by setting the env `provision_k8s` to `true` in the [env file](./env.yml).

Download the kubeconfig file with: </br>
`az aks get-credentials --admin --name $CLUSTER_NAME --resource-group $RESOURCE_GROUP`

For deleting the cluster, execute this command: </br>
`az group delete --name $RESOURCE_GROUP`

For deleting the VM, execute this commande> </br>
`vagrant destroy`
