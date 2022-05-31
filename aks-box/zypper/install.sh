#!/bin/bash

zypper --quiet --non-interactive ref
zypper --quiet --non-interactive install \
    figlet                               \
    curl                                 \
    git                                  \
    wget                                 \
    k9s                                  \
    go1.18                               \
    unzip
