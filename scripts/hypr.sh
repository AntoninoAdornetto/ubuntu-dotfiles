#!/bin/bash

PACMAN_PKGS="hyprland waybar wl-clipboard swappy"
YAY_PKGS="hypridle-git hyprlock-git"

sudo pacman --noconfirm -S $PACMAN_PKGS
yay -S $YAY_PKGS
