#!/bin/bash

PKGS=(
    act
    alacritty
    bear
    blueman
    bluez
    bluez-utils
    btop
    clamav
    fastfetch
    fd
    fzf
    git
    htop
    jq
    keepassxc
    logrotate
    luarocks
    man-db
    man-pages
    nasm
    ncdu
    neovim
    newsboat
    obsidian
    pyenv
    ripgrep
    rofi
    rust-analyzer
    rustup
    signal-desktop
    stow
    sushi
    thunar
    tmux
    ttf-jetbrains-mono
    ttf-jetbrains-mono-nerd
    vim
)

packages=""
for p in "${PKGS[@]}"; do
    packages+="$p "
done

echo "Installing pacman packages..."
sudo pacman --noconfirm -Sy $packages
