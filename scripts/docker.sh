#!/bin/bash

OUT_DIR="$(pwd)/scripts/downloads"
ARCH="docker-desktop-x86_64" # Architecture, not arch linux

if [ -e "$OUT_DIR/${ARCH}*" ]; then
    echo "Removing previous Bruno app image from [$OUT_DIR]"
    rm "$OUT_DIR/${ARCH}*"
else
    echo "Creating temporary downloads directory at: [$OUT_DIR]" 
    mkdir -p "$OUT_DIR"
fi

echo "Fetching docker desktop archive..."
curl -o "$OUT_DIR/$ARCH.pkg.tar.zst" https://desktop.docker.com/linux/main/amd64/$ARCH.pkg.tar.zst

echo "Install docker engine"
sudo pacman --noconfirm -S docker

echo "Installing docker desktop..."
sudo pacman --noconfirm -U "$OUT_DIR/$ARCH.pkg.tar.zst"

echo "Removing docker desktop archive"
rm "$OUT_DIR/$ARCH.pkg.tar.zst"

echo "Starting docker desktop daemon"
systemctl --user start docker-desktop
