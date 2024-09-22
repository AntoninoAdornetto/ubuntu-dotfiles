#!/bin/bash

set -e

WD="$HOME/.dotfiles/scripts/"

# Backup existing dots
source "$WD/backup.sh"

# Install pacman packages
# NOTE: packages outside of the scope of dotfiles will also be installed
source "$WD/pacman.sh"

# Create symlinks 
source "$WD/stow.sh"

# Change the default shell to zsh
chsh -s $(which zsh)

# Install yay and yay packages
source "$WD/yay.sh"

# Install hypr related packages
source "$WD/hypr.sh"

# Install wayland related packages
source "$WD/wayland.sh"

# Set global git settings
source "$WD/git.sh"

# Refresh the font cache
fc-cache -fv

# Enable/Start bluetooth daemon
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# Install node version manager
source "$WD/nvm.sh"

# Install go version manager
source "$WD/goenv.sh"

# Set default rust compiler to stable version
rustup default stable

# Setup docker
# source "$WD/docker.sh"

# Setup bruno app image
source "$WD/bruno.sh"
