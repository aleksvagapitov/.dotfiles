#!/bin/bash

DOTFILES_INSTALL_START=$(date "+%s")
ansible-playbook local.yml 
DOTFILES_INSTALL_END=$(date "+%s")

INSTALL_TIME=$(( DOTFILES_INSTALL_END - DOTFILES_INSTALL_START ))
echo "Dotfiles Install time: ${INSTALL_TIME} seconds"

exit 0

