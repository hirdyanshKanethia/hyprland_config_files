#!/bin/bash

DEVICE_MAC="40:72:18:58:25:E7"

# Turn on Bluetooth (if it's off)
bluetoothctl power on

# Wait until the controller is powered
for i in {1..5}; do
    if bluetoothctl show | grep -q "Powered: yes"; then
        break
    fi
    sleep 1
done

# Get device name
DEVICE_NAME=$(bluetoothctl info "$DEVICE_MAC" | grep "Name:" | cut -d ' ' -f2-)

# Check if device is already connected
if bluetoothctl info "$DEVICE_MAC" | grep -q "Connected: yes"; then
    # Disconnect
    bluetoothctl disconnect "$DEVICE_MAC"
    notify-send -i audio-headphones-symbolic "Bluetooth" "🔌 Disconnected from $DEVICE_NAME"
    bluetoothctl power off
else
    # Trust and connect
    bluetoothctl trust "$DEVICE_MAC"
    bluetoothctl connect "$DEVICE_MAC"

    if bluetoothctl info "$DEVICE_MAC" | grep -q "Connected: yes"; then
        notify-send -i audio-headphones-symbolic "Bluetooth" "🎧 Connected to $DEVICE_NAME"
    else
        notify-send -i dialog-error "Bluetooth" "❌ Failed to connect to $DEVICE_NAME"
    fi
fi
