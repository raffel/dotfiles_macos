local icons = require("icons")
local settings = require("settings")
local colors = require("colors")

-- Padding item required because of bracket
sbar.add("item", {
	position = "right",
	width = settings.group_paddings,
})

local cal = sbar.add("item", "widgets.calendar", {
	icon = {
		padding_right = 0,
		font = {
			style = settings.font.style_map["Bold"],
			size = 9.0,
		},
		string = icons.calendar,
		color = colors.white,
		padding_left = 8,
	},
	label = {
		color = colors.white,
		padding_right = 8,
		width = 105,
		align = "right",
		font = {
			family = settings.icons,
		},
	},
	position = "right",
	update_freq = 30,
	padding_left = 1,
	padding_right = 1,
	background = {
		color = colors.bg1,
		border_color = colors.rainbow[#colors.rainbow],
		border_width = 1,
	},
})

-- Padding item required because of bracket
sbar.add("item", {
	position = "right",
	width = settings.group_paddings,
})

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
	cal:set({
		label = os.date("%a %b %d %H:%M"),
	})
end)
