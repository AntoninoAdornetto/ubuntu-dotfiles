#!/bin/bash

CONFIG_DIR="$HOME/.config"
IMG_DIR="$HOME/Pictures"

if [ ! -d "$IMG_DIR/icons" ];then
    mkdir -p "$IMG_DIR/icons"
fi

if [ ! -d "$IMG_DIR/wallpapers" ];then
    mkdir -p "$IMG_DIR/wallpapers"
fi

# Create symlinks with GNU stow
stow --target="$CONFIG_DIR" .config
stow --target="$IMG_DIR/wallpapers" wallpapers
stow --target="$IMG_DIR/icons" icons
stow tmux
stow zsh
