local awful     = require "awful"
local wibox     = require "wibox"
local beautiful = require "beautiful"
local dpi         = beautiful.xresources.apply_dpi
local utils     = require "utils"

local mykeyboard=awful.widget.keyboardlayout()
mykeyboard.widget.text = string.upper(mykeyboard.widget.text)
mykeyboard.widget:connect_signal("widget::redraw_needed",
	function(wid)
		wid.text = string.upper(wid.text)
	end
)
 
local keyboardlayout = {
  {
    {
        awful.widget.keyboardlayout(),
        widget = wibox.container.place,
        valign = "center"
    },
    widget = wibox.container.margin
  },
  widget = wibox.container.background,
  bg = beautiful.bg_minimize,
  shape = utils.rounded_rect()
}

return keyboardlayout
