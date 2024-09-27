#!/bin/bash

VERSION="v2.2.0"
OUT_DIR="$(pwd)/scripts/downloads"
THEME_DIR="$HOME/.themes"
THEME="Nordic"
FILE_TYPE="tar.xz"
URL="https://github.com/EliverLara/Nordic/releases/download/${VERSION}/Nordic.tar.xz"

# Create output and theme directories if they don't exist
mkdir -p "$OUT_DIR"
mkdir -p "$THEME_DIR"

# Remove any existing theme files
rm -rf "$THEME_DIR/Nordic*"

# Download the theme archive
curl -L -o "$OUT_DIR/${THEME}.${FILE_TYPE}" "$URL"

# Check if the file was downloaded successfully
if [ ! -f "$OUT_DIR/${THEME}.${FILE_TYPE}" ]; then
    echo "Error: File not downloaded."
    exit 1
fi

# Extract into the themes directory
tar -xvJf "$OUT_DIR/${THEME}.${FILE_TYPE}" -C "$THEME_DIR"

# theme is set to execute in the hypr startup apps configuration
HYPR_STARTUP_SCRIPT="$HOME/.dotfiles/.config/hypr/user-configs/startup-apps.conf"

# Replace the current theme in startup apps config with the new them
sed -i -E "s|^exec = gsettings set org.gnome.desktop.interface gtk-theme \".*\"|exec = gsettings set org.gnome.desktop.interface gtk-theme \"$THEME\"|" "$HYPR_STARTUP_SCRIPT"
sed -i -E "s|^exec = gsettings set org.gnome.desktop.wm.preferences theme \".*\"|exec = gsettings set org.gnome.desktop.wm.preferences theme \"$THEME\"|" "$HYPR_STARTUP_SCRIPT"

# Clean up downloads dir
rm -rf "$OUT_DIR/${THEME}.${FILE_TYPE}"
