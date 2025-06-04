#!/bin/bash

# App identifier (use WM_CLASS from xprop)
APP_CLASS="chatty"  # e.g., "firefox" or "discord"

# Get current workspace
CURRENT_WS=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')



# move chat to workspace
i3-msg "[class=$APP_CLASS] move container to workspace $CURRENT_WS"

# move avatar to workspace
i3-msg "[class='2dAvatar'] move container to workspace $CURRENT_WS"

# focus again to resize
i3-msg "[class=$APP_CLASS] focus"
# resize chat
i3-msg "resize shrink width 32 px or 32 ppt"

# unfocus chat
i3-msg "focus left"


