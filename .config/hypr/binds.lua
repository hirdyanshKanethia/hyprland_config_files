-- ~/.config/hypr/binds.lua
local vars = require("variables")

local mainMod = "SUPER"
local shiftMod = "SUPER + SHIFT"
local ctrlMod = "SUPER + CTRL"

-- Fallback helper for legacy layout dispatchers
local function dsp(cmd)
	return hl.dsp.exec_cmd("hyprctl dispatch " .. cmd)
end

hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("pkill wlogout || wlogout"))


hl.bind(
	mainMod .. " + E",
	hl.dsp.exec_cmd("kitty --title yazi --override font_family=Monocraft -e yazi")
)
hl.bind(shiftMod .. " + E", hl.dsp.exec_cmd(vars.fileManager))

hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd("pkill wofi || " .. vars.menu))

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + U", hl.dsp.layout("togglesplit"))

hl.bind(
	mainMod .. " + G",
	hl.dsp.exec_cmd("kitty --title gazelle --override font_size=10 --override font_family=Monocraft -e gazelle")
)

hl.bind(
	mainMod .. " + V",
	hl.dsp.exec_cmd(
		'pkill wofi || cliphist list | wofi --dmenu --prompt "Search Clipboard..." | cliphist decode | wl-copy'
	)
)
hl.bind("SUPER + SHIFT + V", hl.dsp.exec_cmd('cliphist wipe && notify-send "Clipboard Cleared"'))

hl.bind(
	shiftMod .. " + S",
	hl.dsp.exec_cmd('export HYPRSHOT_DIR="$HOME/Pictures/screenshots" && ~/.local/bin/hyprshot -m window')
)
hl.bind(
	mainMod .. " + S",
	hl.dsp.exec_cmd('export HYPRSHOT_DIR="$HOME/Pictures/screenshots" && ~/.local/bin/hyprshot -m region')
)
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -op"))

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle_waybar.sh"))

-- Active window switching (Focus)
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "d" }))

-- Moving windows within the layout
hl.bind(shiftMod .. " + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(shiftMod .. " + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(shiftMod .. " + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(shiftMod .. " + j", hl.dsp.window.move({ direction = "d" }))

-- Resizing active windows
hl.bind(ctrlMod .. " + h", hl.dsp.window.resize({ x = -20, y = 0, relative = true }))
hl.bind(ctrlMod .. " + l", hl.dsp.window.resize({ x = 20, y = 0, relative = true }))
hl.bind(ctrlMod .. " + k", hl.dsp.window.resize({ x = 0, y = 20, relative = true }))
hl.bind(ctrlMod .. " + j", hl.dsp.window.resize({ x = 0, y = -20, relative = true }))

for i = 1, 9 do
	hl.bind(mainMod .. " + " .. tostring(i), hl.dsp.focus({ workspace = i }))
	hl.bind(shiftMod .. " + " .. tostring(i), hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(shiftMod .. " + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + Tab", hl.dsp.workspace.toggle_special("*"))
hl.bind(shiftMod .. " + Tab", hl.dsp.window.move({ workspace = "special:*" }))
-- hl.bind(mainMod .. " + grave", hl.dsp.workspace.toggle_special("@"))
-- hl.bind(shiftMod .. " + grave", hl.dsp.window.move({ workspace = "special:@" }))
hl.bind(mainMod .. " + grave", hl.dsp.exec_cmd("kitty --override font_size=10 --override font_family=Monocraft"))

-- Mouse bindings for moving and resizing windows
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, drag = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Media keys
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ repeating = true, locked = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ repeating = true, locked = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ repeating = true, locked = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ repeating = true, locked = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true, locked = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- experimental

local function open_and_arrange_terminals()
	os.execute("kitty --hold -e fastfetch &")
	os.execute("kitty -e cmatrix -C blue &")
	os.execute("kitty -e tty-clock -c -C 4 &")
	os.execute("kitty -e cava &")

	-- 2. Wait 0.5 seconds for them to load, then reorder them!
	-- local arrange_cmd = [[
	--        (
	--            sleep 0.5
	--            hyprctl dispatch movefocus l
	--            hyprctl dispatch movewindow l
	--        ) &
	--    ]]
	-- os.execute(arrange_cmd)
end

hl.bind(shiftMod .. " + 8", open_and_arrange_terminals)
