#!/bin/bash

BACKUP_DIR="$HOME/.dotfiles-backup/"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"
if [[ ! -e "$BACKUP_DIR/README.md" ]]; then
    echo "Creating backup directory [$BACKUP_DIR]"
    {
        echo "# WARNING!"
        echo "CHECK CONTENTS, (HIDDEN FILES TOO) OF THIS DIR CAREFULLY BEFORE DELETING"
    } > "$BACKUP_DIR/READ_THIS_OR_ELSE.md"
else
    echo "Backup directory exists [$BACKUP_DIR]"
fi

echo "Backing up existing configuration files...."

# Moves a file or directory {src} to [BACKUP_DIR] {dst}
move_existing() {
    local src="$1"
    local dst="$2"
    local base_name

    if [[ -e "$src" ]]; then
        mv "$src" "$dst"
        echo "Moved [$src] to [$dst]"
    else
        echo "Source [$src] does not exist."
    fi
}

# Below are the config files that the init script will intall and set up configs for
# We will back them up in case you need to retrieve or reference them for any reason
declare -a config_files=(
    "$HOME/.bash_logout"
    "$HOME/.bash_profile"
    "$HOME/.bashrc"
    "$HOME/.config/alacritty/"
    "$HOME/.config/hypr/"
    "$HOME/.config/i3/"
    "$HOME/.config/nvim/"
    "$HOME/.config/ohmyposh/"
    "$HOME/.config/polybar/"
    "$HOME/.config/rofi/"
    "$HOME/.config/swappy/"
    "$HOME/.config/wallust/"
    "$HOME/.config/waybar/"
    "$HOME/.zshrc"
    "$HOME/Development/src-builds/"
)

# Loop through the array and back up each file/directory
for file in "${config_files[@]}"; do
    move_existing "$file" "$BACKUP_DIR"
done

