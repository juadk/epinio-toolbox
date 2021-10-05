[![Vagrantfiles check](https://github.com/juadk/epinio-toolbox/actions/workflows/vagrant.yml/badge.svg?branch=main)](https://github.com/juadk/epinio-toolbox/actions/workflows/vagrant.yml)

# epinio-toolbox

The purpose of this repo is to have several fast way for testing Epinio on top of different platforms.

Vagrant is the base of the tests. For now, the Vagrantfiles are written for being used with the libvirt provider only.

Before deploying, you must install [Vagrant](https://www.vagrantup.com/downloads) as well as the [vagrant libvirt provider](https://github.com/vagrant-libvirt/vagrant-libvirt#installation).

Each folders has its own README file:

## eks-box
A basic ready openSUSE TW box for deploying epinio on EKS with all the needed dependencies included.</br>
Make sure to follow the [README](./eks-box/README.md) because some variables have to be configured.

## k3s-Epinio-1-node
Another openSUSE TW box for installing epinio on top of k3s with all the needed dependencies included.</br>
Once again, refer to the [README](./k3s-epinio-1-node/README.md) to configure few mandatory variables before.
