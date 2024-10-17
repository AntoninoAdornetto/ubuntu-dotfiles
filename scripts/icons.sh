#!/bin/bash

# Find the actual Mullvad desktop entry file
MULLVAD_ENTRY=$(find "$HOME/.local/share/applications" -name "*Mullvad*.desktop" -print -quit)

# Check if the Mullvad desktop entry file exists
if [ -z "$MULLVAD_ENTRY" ]; then
    echo "Mullvad desktop entry file not found."
    exit 0
fi

# Check if the Mullvad icon has been set
if grep -q "Icon=" "$MULLVAD_ENTRY"; then
    echo "Mullvad icon is already set..."
else
    echo "Setting Mullvad icon..."
    # Use printf to avoid potential issues with echo and file handling
    printf "\nIcon=/home/$USER/Pictures/icons/mullvad.png\n" >> "$MULLVAD_ENTRY"
    echo "Mullvad icon has been set."
fi

