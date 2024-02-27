local gears     = require "gears"
local awful     = require "awful"
local wibox     = require "wibox"
local beautiful = require "beautiful" 
local utils     = require "utils"

local dpi = beautiful.xresources.apply_dpi

local logotype       = config.bar.logotype.enabled and require "modules.bar.content.logotype" or nil
local tags = config.bar.tags.enabled and (function(s) 
    return require("modules.bar.content.tags").screen_tags(s)
end) or function(s) end
local clock          = config.bar.clock.enabled and require "modules.bar.content.clock" or nil
local keyboardlayout = config.bar.keyboard.enabled and require "modules.bar.content.keyboard" or nil
local micro          = config.bar.micro.enabled and require "modules.bar.content.microphone" or nil
local sound          = config.bar.sound.enabled and require "modules.bar.content.sound" or nil
local systray        = config.bar.systray.enabled and require "modules.bar.content.systray" or nil

local layoutbox = config.bar.layoutbox.enabled and (function(s) 
    return require("modules.bar.content.layoutbox").screen_layout(s)
end) or function(s) end

screen.connect_signal("request::desktop_decoration", function(s)
    -- todo: do more config settings like clock on left/right/center
    s.mywibox = awful.wibar {
        -- bg = "#00000000",
        position = "top",
        screen   = s,
        height = dpi(46),
        widget   =  {
            
        {
            layout = wibox.layout.align.horizontal,
            expand = "none",
            {
                layout = wibox.layout.fixed.horizontal,
                logotype,
                tags(s),
                spacing = dpi(7)
            },
            clock,
            {
                layout = wibox.layout.fixed.horizontal,
                keyboardlayout,
                micro,
                sound,
                systray,
                layoutbox(s),
                spacing = dpi(7)
            },
        },
        widget = wibox.container.margin,
        margins = {
            left = beautiful.useless_gap*2, right = beautiful.useless_gap*2,
            top = dpi(7), bottom = dpi(7)
        }
        }
    }
end)
