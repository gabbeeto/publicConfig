#!/bin/bash

CONTENT=$(cat /tmp/moveChatty.txt)
# Check if Chatty or 2DAvatar are running with tmp file
if [ -z "$CONTENT" ]; then
    # Launch both apps
    java -jar ~/chatty/Chatty.jar &
    ~/2davatar/export/1360x768.x86_64 &
    notify-send "chat and avatar opened"
    echo 'exec ~/.config/i3/moveChatToWorkspace.sh' > /tmp/moveChatty.txt
else
    # Kill both apps
    pkill -f "1360x768.x86_64"  # Example for 2DAvatar
    pkill -f "Chatty.jar"       # Example for Chatty
    notify-send "chat and avatar closed"
    echo '' > /tmp/moveChatty.txt  # Clear state file
fi
