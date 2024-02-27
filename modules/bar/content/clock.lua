local wibox       = require "wibox"
local beautiful   = require "beautiful"
local dpi         = beautiful.xresources.apply_dpi
local utils       = require "utils"
 
local clock = {
  {
    {
      {
        {
          font = beautiful.font_type .. " 12",
          format = "%a %b %d, %H:%M",
          align = "center",
          valign = "center",
          widget = wibox.widget.textclock
        },
        layout = wibox.layout.fixed.horizontal,
        spacing = dpi(10)
      },
      widget = wibox.container.place,
      valign = "center"
    },
    widget = wibox.container.margin,
    margins = { left = dpi(10), right = dpi(10) }
  },
  widget = wibox.container.background,
  bg = beautiful.bg_minimize,
  shape = utils.rounded_rect()
}

return clock
