
#!/bin/bash

# Get current state
state=$(hyprctl getoption animations:enabled | grep 'int:' | awk '{print $2}')

if [ "$state" = "1" ]; then
    hyprctl keyword animations:enabled false
    notify-send "Animations Disabled"
else
    hyprctl keyword animations:enabled true
    notify-send "Animations Enabled"
fi
