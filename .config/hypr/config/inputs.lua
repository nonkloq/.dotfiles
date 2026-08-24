-- Input configuration

hl.config({
	input = {
		-- sensitivity = -0.25,
		accel_profile = "flat",
		natural_scroll = true,

		touchpad = {
			natural_scroll = true,
		},
	},
	-- Uncomment the section below to enable software cursors; this can help with cursor display or behavior issues
	-- cursor = {
	--     no_hardware_cursors = 1,
	-- },
})

-- Navigate Workspace
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Toggle Mission Control/Overview
hl.gesture({
	fingers = 3,
	direction = "vertical",
	action = function()
		hl.plugin.gloview.toggle()
	end,
})
