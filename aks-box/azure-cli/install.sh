#!/bin/bash

figlet azure-cli

rpm --import https://packages.microsoft.com/keys/microsoft.asc
zypper --quiet --non-interactive addrepo --name 'Azure CLI' --check https://packages.microsoft.com/yumrepos/azure-cli azure-cli
zypper --quiet --non-interactive install --auto-agree-with-licenses --from azure-cli azure-cli
