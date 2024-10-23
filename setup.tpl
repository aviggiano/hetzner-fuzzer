#!/usr/bin/env bash

set -eux

echo "Update"
sudo apt-get update

echo "Upgrade"
sudo apt-get upgrade -y

echo "Install dependencies"
sudo apt-get install -y
sudo apt-get install -y python3-pip

echo "Install slither"
sudo pip3 install slither-analyzer --break-system-packages

echo "Install crytic-compile"
sudo pip3 install crytic-compile --break-system-packages

echo "Install solc-select"
sudo pip3 install solc-select --break-system-packages

echo "Install echidna"
wget https://github.com/crytic/echidna/releases/download/v2.2.5/echidna-2.2.5-x86_64-linux.tar.gz -O echidna.tar.gz
tar -xvkf echidna.tar.gz
sudo mv echidna /usr/bin/
rm echidna.tar.gz

echo "Install medusa"
wget https://github.com/crytic/medusa/releases/download/v0.1.8/medusa-linux-x64.tar.gz -O medusa.tar.gz
tar -xvkf medusa.tar.gz
rm medusa.tar.gz
sudo mv medusa /usr/bin/

echo "Install foundry"
curl -L https://foundry.paradigm.xyz | bash
export PATH="$PATH:/.foundry/bin"
foundryup
sudo mv /.foundry/bin/* /usr/bin

echo "Install halmos"
sudo pip3 install halmos --break-system-packages

echo "Running cmd"

${cmd}

echo "Done"