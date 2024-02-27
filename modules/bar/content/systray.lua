local awful       = require "awful"
local wibox       = require "wibox"
local gears       = require "gears"
local beautiful   = require "beautiful"
local dpi         = beautiful.xresources.apply_dpi
local utils       = require "utils"
 

local togglertext = wibox.widget {
  font = beautiful.icon_font .. " 18",
  text = "󰅁",

  buttons = {
    awful.button({}, 1, function()
      awesome.emit_signal('systray::toggle')
    end )
  },
  widget = wibox.widget.textbox,
}

local systray     = wibox.widget {
  {
    {
      widget = wibox.widget.systray,
      base_size = dpi(20)
    },
    widget = wibox.container.place,
    valign = "center"
  },
  widget = wibox.container.margin,
  margins = { left = dpi(10), right = dpi(5) },
  visible = config.bar.systray.opened,
}

if systray.visible then
  togglertext.text = '󰅂'
end

awesome.connect_signal('systray::toggle', function()
  if systray.visible then
    systray.visible = false
    togglertext.text = '󰅁'
  else
    systray.visible = true
    togglertext.text = '󰅂'
  end
end)

local widget = wibox.widget {
  {
    systray,
    togglertext,
    layout = wibox.layout.fixed.horizontal
  },
  bg = beautiful.bg_minimize,
  widget = wibox.container.background,
  shape = utils.rounded_rect()
}

gears.timer {
  timeout   = 5,
  autostart = true,
  callback  = function()
      if awesome.systray() == 0 then -- if systray has no elements
        systray.visible = false
      elseif togglertext.text == '󰅂' then
        systray.visible = true
      end
  end
}


return widget
