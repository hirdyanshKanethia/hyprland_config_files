#!/bin/bash

# Get the current power profile
current_profile=$(powerprofilesctl get)

# Determine the new profile
if [ "$current_profile" == "balanced" ]; then
    new_profile="power-saver"
elif [ "$current_profile" == "power-saver" ]; then
    new_profile="balanced"
else
    notify-send "Power Toggle" "Unsupported profile: $current_profile"
    exit 1
fi

# Set the new power profile
powerprofilesctl set "$new_profile"

# Send a notification
notify-send "Power Mode Changed" "Power mode set to: $new_profile"
