#!/bin/bash

DOTFILES_INSTALL_START=$(date "+%s")
ansible-playbook local.yml 
DOTFILES_INSTALL_END=$(date "+%s")

echo "Dotfiles Install time: " $((DOTFILES_INSTALL_END-DOTFILES_INSTALL_START))

exit 0

