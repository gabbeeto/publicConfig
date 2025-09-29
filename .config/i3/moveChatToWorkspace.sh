#!/bin/bash

# App identifier (use WM_CLASS from xprop)
APP_CLASS="chatterino"  # e.g., "firefox" or "discord"

# Get current workspace
CURRENT_WS=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

GODOT_WORKSPACE="godot"  # Change this as needed

# move chat to workspace
i3-msg "[class=$APP_CLASS] move container to workspace $CURRENT_WS"


# move avatar to workspace
i3-msg "[class='2dAvatar'] move container to workspace $CURRENT_WS"


i3-msg "split h"
# focus again to resize
i3-msg "[class=$APP_CLASS] focus"

i3-msg "layout splith"  # or "layout splitv" depending on your preference



# resize chat
i3-msg "resize shrink width 32 px or 32 ppt"

# unfocus chat
i3-msg "focus left"


if [ "$CURRENT_WS" = "$GODOT_WORKSPACE" ]; then
    i3-msg " layout tabbed"
fi
