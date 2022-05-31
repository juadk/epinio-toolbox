#!/bin/bash

sudo zypper -q --non-interactive ref
sudo zypper -q --non-interactive in \
    figlet \
    curl   \
    git    \
    wget   \
    k9s    \
    go1.18 \
    unzip
