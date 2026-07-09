-- ~/.config/hypr/input.lua

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			clickfinger_behavior = true,
			middle_button_emulation = false,
		},
		scroll_method = "2fg", -- Ensures consistent behavior
	},
})

-- If the mouse scroll is still inverted, force the setting explicitly for the device
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
	natural_scroll = false,
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 4, direction = "swipe", action = "close" })
hl.gesture({ fingers = 3, direction = "vertical", action = "special", workspace_name = "*" })
hl.gesture({ fingers = 2, direction = "pinchin", mods = "SUPER", action = "fullscreen" })
