#!/bin/bash

TARGET="$HOME/.config/hypr/user-configs/monitors.conf"

usage() {
    echo "Script can be invoked with 2 arguments:"
    echo "laptop: alters hypers monitor settings to the prefered laptop settings"
    echo "desktop: alters hypers monitor settings to dual monitor."
}

echo "# Monitor Configuration" > "$TARGET"
echo "# See Hyprland wiki for more details" >> "$TARGET"

case $1 in
    laptop|Laptop)
        echo "You entered laptop mode"
        echo "monitor = , preferred, auto, 1" >> "$TARGET"
        ;;
    desktop|Desktop)
        echo "You entered desktop mode"
        MODE="$DESKTOP_MODE"
        ;;
    *)
        echo "Invalid mode..."
        usage
        exit 1
        ;;
esac
