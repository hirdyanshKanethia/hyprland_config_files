#!/bin/bash

# Replace this with your actual hotspot connection name
HOTSPOT_NAME="baked_car_H"

# Check if Wi-Fi is enabled
WIFI_STATUS=$(nmcli radio wifi)

if [[ "$WIFI_STATUS" == "disabled" ]]; then
    echo "Wi-Fi is off, turning it on..."
    nmcli radio wifi on
    sleep 2  # Wait a bit for it to initialize
fi

# Check if the hotspot connection is already active
STATUS=$(nmcli -t -f NAME,TYPE,DEVICE connection show --active | grep "$HOTSPOT_NAME")

if [[ -n "$STATUS" ]]; then
    # Hotspot is active — turn it off
    nmcli connection down "$HOTSPOT_NAME"
    nmcli radio wifi off
    notify-send "Hotspot" "'$HOTSPOT_NAME' turned off"
else
    # Hotspot is not active — turn it on
    nmcli connection up "$HOTSPOT_NAME"
fi
