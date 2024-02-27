local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")

local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

modkey = "Mod4"

-- /mouse
client.connect_signal("request::default_mousebindings", function()
	awful.mouse.append_client_mousebindings({
		awful.button({}, 1, function(c)
			c:activate({ context = "mouse_click" })
		end),
		awful.button({ modkey }, 1, function(c)
			c:activate({ context = "mouse_click", action = "mouse_move" })
		end),
		awful.button({ modkey }, 3, function(c)
			c:activate({ context = "mouse_click", action = "mouse_resize" })
		end),
	})
end)

-- /keyboard
-- General Awesome keys
awful.keyboard.append_global_keybindings({
	awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey }, "Return", function()
		awful.spawn(terminal)
	end, { description = "open a terminal", group = "launcher" }),
})

if config.launcher.enabled then
	awful.keyboard.append_global_keybindings({
		awful.key({ modkey }, "d", function()
			awesome.emit_signal("widget::launcher")
		end, { description = "show launcher", group = "launcher" }),
	})
end

awful.keyboard.append_global_keybindings({
	awful.key({}, "Print", function()
		awful.spawn.with_shell("maim -s | xclip -selection clipboard -t image/png")
	end, { description = "screenshot", group = "client" }),
})

awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "l", function()
		awful.spawn.with_shell("slock")
	end, { description = "screenshot", group = "client" }),
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),
})

-- Widgets
if config.bar.sound.enabled then
	awful.keyboard.append_global_keybindings({
		awful.key({ modkey }, "v", function()
			awful.spawn("wpctl set-volume -l 1 @DEFAULT_SINK@ 5%+")
		end, { description = "up volume", group = "widgets" }),

		awful.key({ modkey, "Shift" }, "v", function()
			awful.spawn("wpctl set-volume -l 1 @DEFAULT_SINK@ 5%-")
		end, { description = "down volume", group = "widgets" }),

		awful.key({ modkey, "Shift" }, "m", function()
			awful.spawn("wpctl set-mute @DEFAULT_SINK@ toggle")
		end, { description = "mute volume", group = "widgets" }),
	})
end

if config.bar.micro.enabled then
	awful.keyboard.append_global_keybindings({
		awful.key({ modkey }, "m", function()
			awful.spawn("wpctl set-mute @DEFAULT_SOURCE@ toggle")
		end, { description = "mute microphone", group = "widgets" }),
	})
end

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	awful.key({ modkey }, "w", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, "Control" }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
})

awful.keyboard.append_global_keybindings({
	awful.key({
		modifiers = { modkey },
		keygroup = "numrow",
		description = "only view tag",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				tag:view_only()
			end
		end,
	}),
	awful.key({
		modifiers = { modkey, "Control" },
		keygroup = "numrow",
		description = "toggle tag",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end,
	}),
	awful.key({
		modifiers = { modkey, "Shift" },
		keygroup = "numrow",
		description = "move focused client to tag",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end,
	}),
	awful.key({
		modifiers = { modkey, "Control", "Shift" },
		keygroup = "numrow",
		description = "toggle focused client on tag",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end,
	}),
	awful.key({
		modifiers = { modkey },
		keygroup = "numpad",
		description = "select layout directly",
		group = "layout",
		on_press = function(index)
			local t = awful.screen.focused().selected_tag
			if t then
				t.layout = t.layouts[index] or t.layout
			end
		end,
	}),
})

client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings({
		awful.key({ modkey }, "f", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, { description = "toggle fullscreen", group = "client" }),
		awful.key({ modkey, "Shift" }, "c", function(c)
			c:kill()
		end, { description = "close", group = "client" }),
		awful.key(
			{ modkey, "Control" },
			"space",
			awful.client.floating.toggle,
			{ description = "toggle floating", group = "client" }
		),
		awful.key({ modkey }, "o", function(c)
			c:move_to_screen()
		end, { description = "move to screen", group = "client" }),
	})
end)
