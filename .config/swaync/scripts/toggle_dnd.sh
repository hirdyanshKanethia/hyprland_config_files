#!/bin/bash

# Toggle DND and capture the new state ('on' or 'off')
DND_STATE=$(swaync-client -d)

# Define icons
ICON_ON="notifications-disabled-symbolic"
ICON_OFF="preferences-system-notifications-symbolic"

# Set message and icon based on DND state
if [[ "$DND_STATE" == "true" ]]; then
    notify-send -i "$ICON_ON" "Do Not Disturb" "DND is now ON"
else
    notify-send -i "$ICON_OFF" "Do Not Disturb" "DND is now OFF"
fi
