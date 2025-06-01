#!/bin/bash
direction=$1

# List your workspaces IN ORDER - EDIT THESE TO MATCH YOURS
WORKSPACES="terminals video godot art discord obs browsers"

# Get current workspace
current=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

# Convert string to array (compatible method)
set -- $WORKSPACES
count=$#
found=0

# Find current position
for ((i=1; i<=count; i++)); do
    if [ "$current" = "${!i}" ]; then
        found=1
        break
    fi
done

# If not found, default to first workspace
[ $found -eq 0 ] && i=1

# Calculate target
if [ "$direction" = "next" ]; then
    i=$((i % count + 1))
else
    i=$(( (i + count - 2) % count + 1 ))
fi

# Get target workspace
target="${!i}"

# Execute the move

i3-msg "move container to workspace \"$target\"; workspace \"$target\""
