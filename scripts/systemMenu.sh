#!/bin/bash

# Show menu with fuzzel
CHOICE=$(echo -e "Time\nAudio Control" | fuzzel --dmenu --lines=2)

# Handle selection
case "$CHOICE" in
    "Time")
        notify-send "Current time" "$(date '+%H:%M')"
        ;;
    "Audio Control")
        pavucontrol &
        ;;
    *)
        exit 0
        ;;
esac
