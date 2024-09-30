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
    dotnet-runtime
    dotnet-sdk
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
    rust-analyzer
    rustup
    signal-desktop
    stow
    sushi
    swaync
    thunar
    tmux
    ttf-jetbrains-mono
    ttf-jetbrains-mono-nerd
    vim
    zsh
)

packages=""
for p in "${PKGS[@]}"; do
    packages+="$p "
done

echo "Installing pacman packages..."
sudo pacman --noconfirm -Sy $packages
