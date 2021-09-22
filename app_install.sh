#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo priveledge to run this script"

echo installing the must-have pre-requisites
while read -r p ; do sudo apt-get install -y $p ; done < <(cat << "EOF"
    git
    curl
    wget
    openjdk-8-jdk
    nodejs
EOF
)

sudo snap install --classic code
sudo snap install slack --classic
sudo snap install postman

echo "FIM"
