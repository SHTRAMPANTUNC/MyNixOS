local awful       = require "awful"
local wibox       = require "wibox"
local beautiful   = require "beautiful"
local dpi         = beautiful.xresources.apply_dpi
local utils       = require "utils"

local tags = {}

tags.screen_tags = function(s) 
  return awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    style = {
        shape = utils.rounded_rect()
    },
    layout = {
        spacing = dpi(7),
        layout  = wibox.layout.fixed.horizontal
    },
    buttons = {
        awful.button({ }, 1, function(t) t:view_only() end),
        awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
        awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
    },
    widget_template = { 
    {
        {
            id     = "text_role",
            widget = wibox.widget.textbox,
        },
        left  = 12,
        right = 12,
        widget = wibox.container.margin
    },
    id     = "background_role",
    widget = wibox.container.background,
    bg = beautiful.bg_minimize
    }
  }
end

return tags