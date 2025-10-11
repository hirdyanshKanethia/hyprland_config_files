# Battery thresholds
LOW=20
CRITICAL=10

# Simulated for testing (comment these when using real values)
# BATTERY_LEVEL=5
# CHARGING_STATUS="Discharging"

# Use this for real battery info
BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
CHARGING_STATUS=$(cat /sys/class/power_supply/BAT0/status)

STATE_FILE="/tmp/battery_notify_state"

notify() {
    case "$1" in
        critical)
            notify-send -u critical "Battery Critical 󰂃" "$2"
            ;;
        normal)
            notify-send -u normal "Battery Low 󰂃" "$2"
            ;;
        *)
            notify-send -u low "Battery Notice" "$2"
            ;;
    esac
}

if [[ -f "$STATE_FILE" ]]; then
    PREV_LEVEL=$(cat "$STATE_FILE")
else
    PREV_LEVEL=100
fi

if [[ "$CHARGING_STATUS" != "Charging" ]]; then
    if (( BATTERY_LEVEL <= CRITICAL && PREV_LEVEL > CRITICAL )); then
        notify critical "Battery is critically low ($BATTERY_LEVEL%)"
    elif (( BATTERY_LEVEL <= LOW && PREV_LEVEL > LOW )); then
        notify normal "Battery is low ($BATTERY_LEVEL%)"
    fi
fi

echo "$BATTERY_LEVEL" > "$STATE_FILE"
