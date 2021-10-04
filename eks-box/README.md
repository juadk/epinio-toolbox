# EKS box

Before deploying, make sure to customize the deployment with the variables within the [env.yml](./env.yml) file.</br>
Your aws credentials has to be filled in the [secrets.yml](secrets.yml) file.

Once done, start the deployment with `vagrant up`.</br>
Then, you should be able to login into the VM with `vagrant ssh` and create the EKS cluster:

```
eksctl create cluster --name=$AWS_EKS_CLUSTER_NAME \
              --region=$AWS_REGION \
              --nodes=$AWS_EKS_NODE_COUNT \
              --node-type=$AWS_EKS_NODE_VM_SIZE \
              --node-volume-size=$AWS_EKS_NODE_DISK_SIZE \
              --ssh-access --ssh-public-key $AWS_SSH_KEY \
              --managed \
              --kubeconfig=$AWS_EKS_KUBECONFIG
```

For deleting the cluster, execute this command: </br>
`eksctl delete cluster --region=$AWS_REGION --name=$AWS_EKS_CLUSTER_NAME`
