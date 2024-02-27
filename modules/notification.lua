local awful = require "awful"
local naughty = require "naughty"
local ruled = require "ruled"
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local utils       = require "utils"
local dpi         = beautiful.xresources.apply_dpi

naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)

ruled.notification.connect_signal('request::rules', function()
    ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            implicit_timeout = 5,
            border_width = beautiful.border_width,
            border_color = beautiful.border_color_normal
        }
    }
end)

naughty.connect_signal("request::display", function(n)
    local client_name = next(n.clients) ~= nil and {
        font = beautiful.font_type .. " 9",
        markup = utils.colored_text(n.clients[1].name, beautiful.bg_focus),
        widget = wibox.widget.textbox
    } or nil
    naughty.layout.box {
        notification = n,
        minimum_width = dpi(160),
        maximum_width = dpi(800),
        maximum_height = dpi(160),
        y = 10,
        widget_template = {
        {
            widget = wibox.container.constraint,
            strategy = "max",
            {
                widget = naughty.container.background,
                id = "background_role",
                {
                    widget = wibox.container.margin,
                    margins = dpi(16),
                    {

                        layout = wibox.layout.fixed.vertical,
                        spacing = dpi(8),
                        client_name,
                        {
                            layout = wibox.layout.fixed.horizontal,
                            spacing = dpi(16),
                            fill_space = true,
                            {
                                {
                                    widget = wibox.container.background,
                                    shape = utils.rounded_rect(6),
                                    naughty.widget.icon,
                                    valign = "center"
                                },
                                widget = wibox.container.place,
                                valign = "center",
                            },
                            {
                                {
                                    layout = wibox.layout.fixed.vertical,
                                    spacing = 10,
                                    naughty.widget.title,
                                    naughty.widget.message,
                                },
                                widget = wibox.container.place,
                                valign = "center",
                                halign = "left"
                            }
                        }
                    }
                }
            }
        },
        widget = wibox.container.background,
        bg = beautiful.bg_minimize,
        shape = utils.rounded_rect(6)
        }
    }
end)