#!/bin/bash

INSTALL_DIR=~/.ssh
SCRIPT_RAW_URL_PREFIX=https://github.com/MisakaMikoto-35c5/ssh-keys-auto-updater/raw/main

mkdir -p $INSTALL_DIR
chmod 700 $INSTALL_DIR

touch $INSTALL_DIR/github_authorized_keys
touch $INSTALL_DIR/authorized_keys_base
touch $INSTALL_DIR/authorized_keys

chmod 600 $SSH_DIR/github_authorized_keys
chmod 600 $SSH_DIR/authorized_keys_base
chmod 644 $SSH_DIR/authorized_keys

wget -O ~/.ssh/update-keys.sh $SCRIPT_RAW_URL_PREFIX/update-keys.sh
chmod 600 ~/.ssh/update-keys.sh
