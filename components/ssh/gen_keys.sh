#!/usr/bin/env bash

# Run this script on source machine


DIRECTORY=`readlink -f ~/.ssh`

if [ ! -d "${DIRECTORY}" ]; then
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
  cd ~/.ssh && ls -ltra
else
  echo "~/.ssh already exist."
fi

echo "Copy SSH public key to target machine:"
echo "scp ~/.ssh/id_rsa.pub <username>@<host>:~"
