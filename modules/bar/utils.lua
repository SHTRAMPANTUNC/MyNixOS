local utils        = {}
local awful          = require("awful")
local beautiful      = require("beautiful")
local gears          = require("gears")
local dpi            = beautiful.xresources.apply_dpi

utils.rounded_rect = function(radius)
  radius = radius or beautiful.rounding
  return function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, radius)
  end
end

utils.colored_text = function(txt, color)
  if color == nil then
    color = "#ffffff"
  end

  return "<span foreground='" .. color .. "'>" .. txt .. "</span>"
end

return utils