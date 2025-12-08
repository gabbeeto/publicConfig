#!/bin/bash

# Show menu with fuzzel
CHOICE=$(echo -e "Time\nAudio Control\nBattery" | fuzzel --dmenu --lines=3)

# Handle selection
case "$CHOICE" in
    "Time")
        notify-send "Current time" "$(date '+%H:%M')"
        ;;
    "Audio Control")
        pavucontrol &
        ;;
    "Battery")
        notify-send "`upower -i $(upower -e | grep battery) | grep -E "state|time|percentage"`"
        ;;
    *)
        exit 0
        ;;
esac
