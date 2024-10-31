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
        printf "monitor = DP-4, 1920x1080, 0x0, 1
monitor = DP-5, 1920x1080, 1920x0, 1
monitor = eDP-1, disabled\n
workspace = 1, monitor:DP-4
workspace = 2, monitor:DP-5
workspace = 3, monitor:DP-5
workspace = 4, monitor:DP-5
workspace = 5, monitor:DP-5
workspace = 6, monitor:DP-5
workspace = 7, monitor:DP-5
workspace = 8, monitor:DP-5
workspace = 9, monitor:DP-5
workspace = 10, monitor:DP-5\n" >> "$TARGET"
        ;;
    *)
        echo "Invalid mode..."
        usage
        exit 1
        ;;
esac
