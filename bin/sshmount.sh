#!/bin/bash

ADDR=$1
DIR=$2
[[ -z "${DIR}" ]] && { echo "Missing argument for directory"; exit 1; }

[[ -d "${HOME}/${DIR}" ]] && echo "Mounting ${ADDR} in ${HOME}/${DIR}" || { echo "Folder does not exist"; exit 1; }

sshfs ${ADDR} ${HOME}/${DIR} -o reconnect
