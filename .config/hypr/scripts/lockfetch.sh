#!/bin/bash

echo " $(fastfetch --logo none --structure OS --format plain | tail -1)"
echo "󰒋 $(uname -r)"
echo "󰍛 $(fastfetch --logo none --structure CPU --format plain | tail -1)"
echo "󰾆 $(free -h | awk '/Mem:/ {print $3 \" / \" $2}')"
echo "󰂄 $(cat /sys/class/power_supply/BAT0/capacity)%"
