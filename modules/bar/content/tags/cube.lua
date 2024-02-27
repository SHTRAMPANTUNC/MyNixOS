local awful       = require "awful"
local wibox       = require "wibox"
local beautiful   = require "beautiful"
local dpi         = beautiful.xresources.apply_dpi
local utils       = require "utils"

local tags = {}

beautiful.taglist_bg_focus = beautiful.bg_focus
beautiful.taglist_bg_empty = "#b5bfe2" .. '33'

tags.screen_tags = function(s) 
    return {{
        awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        style = {
            shape = utils.rounded_rect()
        },
        layout = {
            spacing = dpi(14),
            layout  = wibox.layout.fixed.horizontal
        },
        buttons = {
            awful.button({}, 1, function(t) t:view_only() end)
        },
        widget_template = { 
        {
            {
                markup = '',
                shape  = utils.rounded_rect(),
                widget = wibox.widget.textbox,
            },
            valign        = 'center',
            id            = 'background_role',
            shape         = utils.rounded_rect(),
            widget        = wibox.container.background,
            forced_width  = 10,
            forced_height = 10,
        },
        widget = wibox.container.place,
        }},
        widget = wibox.container.margin,
        margins = { left = dpi(10), right = dpi(10) }
    },
    widget = wibox.container.background,
    bg = beautiful.bg_minimize,
    shape = utils.rounded_rect(),
    buttons = {
        awful.button({}, 4, function(t)
        awful.tag.viewprev(t.screen)
        end),
        awful.button({}, 5, function(t)
        awful.tag.viewnext(t.screen)
        end)
    },
}
end

return tags