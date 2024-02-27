local awful       = require "awful"
local wibox       = require "wibox"
local beautiful   = require "beautiful"
local dpi         = beautiful.xresources.apply_dpi
local utils       = require "utils"
 
local microphone = wibox.widget {
  font = beautiful.icon_font .. " 14",
  text = '󰍬',
  widget = wibox.widget.textbox
}

local micro = wibox.widget {
  {
    microphone,
    widget = wibox.container.margin,
    margins = { left = dpi(8), right = dpi(8) }
  },
  widget = wibox.container.background,
  bg = beautiful.bg_minimize,
  shape = utils.rounded_rect(),
  buttons = {
    awful.button({}, 1, function()
      awesome.emit_signal('microphone::toggle')
    end)
  }
}

awesome.connect_signal("signal::microphone", function(mute)
  if mute then
    microphone.text = '󰍭'
  else
    microphone.text = '󰍬'
  end
end)

awesome.connect_signal('microphone::toggle', function()
  awful.spawn("wpctl set-mute @DEFAULT_SINK@ toggle")
  if microphone.text == '󰍬' then
    microphone.text = '󰍭'
  else
    microphone.text = '󰍬'
  end
end)

return micro
