-- ~/.config/hypr/rules.lua

hl.window_rule({
	suppress_event = "maximize",
	match = { class = ".*" },
})

hl.window_rule({
	no_focus = true,
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
})

hl.layer_rule({ blur = true, match = { namespace = "waybar" } })
hl.layer_rule({ ignore_alpha = 0, match = { namespace = "waybar" } })
hl.layer_rule({ blur = true, match = { namespace = "wofi" } })
hl.layer_rule({ blur = true, match = { namespace = "swaync-control-center" } })
hl.layer_rule({ ignore_alpha = 0, match = { namespace = "swaync-control-center" } })
hl.layer_rule({ blur = true, match = { namespace = "logout_dialog" } })

hl.window_rule({
	float = true,
	match = { title = "^(gazelle)$" },
})

hl.window_rule({
	center = true,
	match = { title = "^(gazelle)$" },
})

hl.window_rule({
	size = "800 780",
	match = { title = "^(gazelle)$" },
})

hl.window_rule({
	opacity = "0.85 0.85",
	match = { class = "^(YouTube Music Desktop App)$" },
})
