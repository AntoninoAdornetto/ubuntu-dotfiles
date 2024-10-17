#!/bin/bash

CONFIG_DIR="$HOME/.config"
IMG_DIR="$HOME/Pictures"

# Create symlinks with GNU stow
stow --target="$CONFIG_DIR" .config
stow --target="$IMG_DIR" wallpapers
stow tmux
stow zsh
