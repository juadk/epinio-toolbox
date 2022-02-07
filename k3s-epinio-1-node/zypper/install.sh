#!/bin/bash

sudo zypper -q --non-interactive ref
sudo zypper -q --non-interactive in \
    figlet \
    curl   \
    git    \
    wget   \
    make   \
    docker \
    unzip

sudo zypper -q --non-interactive in -t pattern apparmor

sudo usermod -aG docker vagrant
sudo systemctl enable --now docker
