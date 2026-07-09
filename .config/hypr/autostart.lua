-- ~/.config/hypr/autostart.lua

hl.on("hyprland.start", function()
    -- Core Services
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")

    -- Connectivity & Audio
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("nmcli radio wifi on")
    hl.exec_cmd("bluetoothctl power on")
    hl.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ 1")

    -- Clipboard Management (cliphist)
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Notification Daemon Check (Optional)
    hl.exec_cmd("swaync-client -df")
end)
