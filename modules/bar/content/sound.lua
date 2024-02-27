local awful       = require "awful"
local wibox       = require "wibox"
local beautiful   = require "beautiful"
local dpi         = beautiful.xresources.apply_dpi
local utils       = require "utils"

local volume = wibox.widget {
  font = beautiful.icon_font .. " 14",
  text = '󰕾 ',
  widget = wibox.widget.textbox
}

local volume_text = config.bar.sound.text and (wibox.widget {
  font = beautiful.font_type .. " 11",
  text = 'Z',
  widget = wibox.widget.textbox
}) or nil

local sound = {
  {
    {
      {
        volume,
        volume_text,
        layout = wibox.layout.fixed.horizontal,
        spacing = dpi(2)
      },
      widget = wibox.container.place,
      valign = "center"
    },
    widget = wibox.container.margin,
    margins = { left = dpi(8), right = dpi(9) }
  },
  widget = wibox.container.background,
  bg = beautiful.bg_minimize,
  shape = utils.rounded_rect(),
  buttons = {
    awful.button({ }, 1, function() awesome.emit_signal('volume::toggle') end),
    awful.button({ }, 4, function(t) awful.spawn("wpctl set-volume -l 1 @DEFAULT_SINK@ 5%+") end),
    awful.button({ }, 5, function(t) awful.spawn("wpctl set-volume -l 1 @DEFAULT_SINK@ 5%-") end)
  }
}

awesome.connect_signal("signal::volume", function(value, mute, micro_mute)
  if mute then
    volume.text = '󰖁 '
  end

  if value > 66 then
    if not mute then
    volume.text = '󰕾 '
    end
    if config.bar.sound.text then
    volume_text.text = value .. "%"
    end
  elseif value > 33 then
    if not mute then
    volume.text = '󰖀 '
    end
    if config.bar.sound.text then
    volume_text.text = value .. "%"
    end
  else
    if not mute then
    volume.text = '󰕿 '
    end
    if config.bar.sound.text then
    volume_text.text = value .. "%"
    end
  end
end)

old_volume = ""

awesome.connect_signal('volume::toggle', function()
  awful.spawn("wpctl set-mute @DEFAULT_SINK@ toggle")
  if volume.text ~= '󰖁 ' then
    old_volume = volume.text
    volume.text = '󰖁 '
  else
    volume.text = old_volume
  end
end)

return sound
