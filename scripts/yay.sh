#!/bin/bash

TARGET_DIR="$HOME/Development/src-builds/yay"

PKGS=(
    mullvad-browser-bin
    oh-my-posh-bin
    pika-backup
    tableplus
)

if ! [[ -d "$TARGET_DIR" ]]; then
    mkdir -p "$TARGET_DIR"
fi

echo "Checking if git and base development packages are installed..."
sudo pacman -S --needed git base-devel

echo "Cloning yay repository into [$TARGET_DIR]..."
git clone https://aur.archlinux.org/yay.git "$TARGET_DIR"

cd "$TARGET_DIR"

echo "Building yay..."
makepkg -si

echo "Removing go from pacman (goenv will be be utilized instead)..."
sleep 1

sudo pacman --noconfirm -Rns go

echo "Download signing key for mullvad-browser"
gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org
gpg --fingerprint torbrowser@torproject.org
gpg --gen-key
gpg --sign-key torbrowser@torproject.org

packages=""
for p in "${PKGS[@]}"; do
    packages+="$p "
done

yay --noconfirm -Sy $packages
