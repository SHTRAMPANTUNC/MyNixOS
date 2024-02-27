local awful       = require "awful"
local wibox       = require "wibox"
local beautiful   = require "beautiful"
local dpi         = beautiful.xresources.apply_dpi
local utils       = require "utils"
 
local layoubox = {}

layoubox.screen_layout = function(s) 
  return {
    {
      {
          widget = awful.widget.layoutbox,
          screen  = s,
          buttons = {
              awful.button({ }, 1, function () awful.layout.inc( 1) end)
          }
      },
      widget = wibox.container.margin,
      margins = dpi(6)
    },
    widget = wibox.container.background,
    bg = beautiful.bg_minimize,
    shape = utils.rounded_rect()
  }
end

return layoubox
