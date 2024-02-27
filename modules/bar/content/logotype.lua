local wibox       = require "wibox"
local beautiful   = require "beautiful"
local dpi         = beautiful.xresources.apply_dpi
local utils       = require "utils"
 
local logotype = {
  {
      wibox.widget.imagebox(beautiful.logo),
      widget = wibox.container.margin,
      margins = dpi(6)
  },
  widget = wibox.container.background,
  bg = beautiful.bg_minimize,
  shape = utils.rounded_rect()
}

return logotype
