local awful = require("awful")
local ruled = require("ruled")

-- Rules ----------------

ruled.client.connect_signal("request::rules", function()
	-- global ---------------

	ruled.client.append_rule({
		id = "titlebars",
		rule_any = { type = { "normal", "dialog" } },
		properties = { titlebars_enabled = false },
	})

	ruled.client.append_rule({
		id = "global",
		rule = {},
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			size_hints_honor = false,
			screen = awful.screen.preferred,
			placement = function(c)
				awful.placement.centered(c, c.transient_for)
				awful.placement.no_overlap(c)
				awful.placement.no_offscreen(c)
			end,
		},
	})

	-- User rules ---------------

	ruled.client.append_rule({
		rule_any = { class = { "firefox" } },
		properties = { screen = "HDMI-0", tag = "1", switchtotag = true },
	})
	ruled.client.append_rule({
		rule_any = { class = { "discord" } },
		properties = { screen = "HDMI-0", tag = "2" },
	})
	ruled.client.append_rule({
		rule_any = { class = { "TelegramDesktop" } },
		properties = { screen = "HDMI-0", tag = "3" },
	})
	ruled.client.append_rule({
		rule_any = { class = { "via-nativia" } },
		properties = { floating = true },
	})
	ruled.client.append_rule({
		rule_any = { class = { "Spotify" } },
		properties = { screen = "HDMI-0", tag = "4" },
	})
	ruled.client.append_rule({
		rule_any = { class = { "steam" } },
		properties = { screen = "DP-0", tag = "3" },
	})
	ruled.client.append_rule({
		rule_any = { class = { "feh" } },
		properties = { fullscreen = true },
	})
end)

client.connect_signal("mouse::enter", function(c)
	c:activate({ context = "mouse_enter", raise = false })
end)

-- Center dialogs over screen ----

client.connect_signal("request::manage", function(c)
	if c.transient_for then
		awful.placement.centered(c, c.transient_for)
		awful.placement.no_offscreen(c)
	end
end)
