#!/bin/bash

TEMP_FILE="/tmp/wf-recorder-active"
OUTPUT_DIR="$HOME/Videos/Me"
FILENAME="wf_$(date +%Y%m%d_%H%M%S).mp4"

# Create videos directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

if [ -f "$TEMP_FILE" ]; then
    # Stop recording
    pkill wf-recorder
    rm -f "$TEMP_FILE"
    notify-send "Recording stopped" "$FILENAME"
else
    # Start recording
    touch "$TEMP_FILE"
    wf-recorder --file="$OUTPUT_DIR/$FILENAME" &
    echo $! > "$TEMP_FILE"
    notify-send "Screen Recording" "$FILENAME"
fi
