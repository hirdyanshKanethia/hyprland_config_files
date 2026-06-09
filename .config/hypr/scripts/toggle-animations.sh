#!/bin/bash
# Toggle Hyprland animations

state=$(hyprctl animations -j | jq -r '.[0][0].enabled')

if [ "$state" = "true" ]; then
    hyprctl lua "hl.animation({ leaf = 'global', enabled = false })"
    notify-send "Animations Disabled"
else
    hyprctl lua "hl.animation({ leaf = 'global', enabled = true })"
    notify-send "Animations Enabled"
fi
