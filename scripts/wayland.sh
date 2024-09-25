#!/bin/bash

PKGS="grim slurp swappy swww rofi-wayland waybar wl-clipboard"
RM_PKGS="rofi"

# Conflicting packages
sudo pacman -Rns --noconfirm $RM_PKGS

sudo pacman --noconfirm -S $PKGS
