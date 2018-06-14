#!/bin/bash

[[ "$1" == "" ]] && { echo 'Missing argument for frequncy'; exit 0; }

echo "Setting cpu frequncy to $1MHz"
sudo cpupower frequency-set -u $1MHz
