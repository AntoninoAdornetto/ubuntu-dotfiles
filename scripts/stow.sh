#!/bin/bash

CONFIG_DIR="$HOME/.config"

# Create symlinks with GNU stow
stow --target="$CONFIG_DIR" .config
stow tmux
stow zsh
