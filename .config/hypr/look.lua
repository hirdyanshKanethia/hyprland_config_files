-- ~/.config/hypr/look.lua

hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 5,
		border_size = 3,
		col = {
			active_border = { colors = { "rgb(2D53A8)", "rgb(6FB9DB)" }, angle = 300 },
			inactive_border = "rgb(6a6c82)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 5,
		active_opacity = 1.0,
		inactive_opacity = 0.9,
		blur = {
			enabled = true,
			size = 2,
			passes = 3,
			new_optimizations = true,
		},
	},
	animations = {
		enabled = true,
	},
	dwindle = {
		preserve_split = true,
	},
	master = {
		new_status = "master",
	},
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},
})

-- Curves must be defined with hl.curve(), outside hl.config()
hl.curve("snappy", { type = "bezier", points = { { 0.2, 0.9 }, { 0.1, 1.0 } } })
hl.curve("instant", { type = "bezier", points = { { 0.3, 1.0 }, { 0.2, 1.0 } } })

local animations = {
	{ leaf = "windows", enabled = true, speed = 3, bezier = "snappy" },
	{ leaf = "windowsOut", enabled = true, speed = 3, bezier = "instant", style = "popin 85%" },
	{ leaf = "border", enabled = true, speed = 4, bezier = "snappy" },
	{ leaf = "borderangle", enabled = true, speed = 5, bezier = "snappy" },
	{ leaf = "fade", enabled = true, speed = 3, bezier = "instant" },
	{ leaf = "workspaces", enabled = true, speed = 3, bezier = "snappy" },
}

-- Apply the table on startup
for _, anim in ipairs(animations) do
	hl.animation(anim)
end

local animations_enabled = true

local function toggle_animations()
	animations_enabled = not animations_enabled
	for _, anim in ipairs(animations) do
		if animations_enabled then
			hl.animation(anim) -- restore full definition
		else
			hl.animation({ leaf = anim.leaf, enabled = false })
		end
	end
	hl.notification.create({
		text = animations_enabled and "Animations Enabled" or "Animations Disabled",
		timeout = 3000,
		icon = "ok",
	})
end

local mainMod = "SUPER"
hl.bind(mainMod .. " + A", toggle_animations)
