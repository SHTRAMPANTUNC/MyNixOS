local gears                                     = require("gears")
local awful                                     = require("awful")
local wibox                                     = require("wibox")
local dpi                                       = require("beautiful.xresources").apply_dpi
local theme_assets                              = require("beautiful.theme_assets")
local gfs                                       = require("gears.filesystem")
local themes_path                               = "/home/kuper/.config/awesome/themes/catppuccin/"
local theme                                     = {}

local os                                        = os
local my_table                                  = awful.util.table or gears.table -- 4.{0,1} compatibility
theme.fg_normal                                 = "#cdd6f4"
theme.fg_focus                                  = "#1E1E2E"
theme.bg_minimize                               = "#313244"
theme.fg_urgent                                 = "#cdd6f4"
theme.bg_normal                                 = "#1E1E2E"
theme.bg_focus                                  = "#89b4fa"
theme.bg_urgent                                 = "#eba0ac"
theme.bg_occupied                               = "#9fa8e1"
theme.border_normal                             = "#1E1E2E"
theme.border_focus                              = "#cba6f7"
theme.border_marked                             = "#cba6f7"
theme.prompt_bg_cursor                          = "#9CABCA"
theme.taglist_bg_focus                          = theme.bg_focus
theme.taglist_fg_focus                          = theme.fg_focus
theme.taglist_bg_urgent                         = theme.bg_urgent
theme.taglist_fg_urgent                         = theme.fg_focus
theme.taglist_bg_empty                          = theme.bg_minimize
theme.taglist_fg_empty                          = theme.fg_normal
theme.taglist_bg_occupied                       = theme.bg_occupied 
theme.taglist_fg_occupied                       = theme.fg_focus
theme.bg_systray                                = theme.bg_minimize
theme.menu_bg_focus                             = theme.bg_minimize
theme.menu_height                               = dpi(12)
theme.menu_width                                = dpi(120)
theme.notification_spacing                      = dpi(6)
theme.systray_icon_spacing                      = dpi(5)
theme.rounding                                  = dpi(2)
theme.useless_gap                               = dpi(12)
theme.border_width                              = dpi(3)
theme.layout_tile                               = themes_path .. "/icon/tile.png"
theme.arch_logo                                 = gears.color.recolor_image(config.bar.logotype.image, theme.fg_focus)
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/catppuccin"
theme.logo                                      = gears.color.recolor_image(config.bar.logotype.image, "#b9c0d9")
theme.wallpaper                                 = "/home/kuper/.config/awesome/themes/catppuccin/wall2.jpg"
theme.font                                      = "JetBrainsMonoNL Nerd Font Mono 12"
theme.font_type                                 = "JetBrainsMonoNL Nerd Font Mono"
theme.icon_font                                 = "Material Design Icons"

-- Recolor Layout icons:
theme                                           = theme_assets.recolor_layout(theme, theme.fg_normal)
theme.icon_theme                                = nil

-- Generate Awesome icon:
theme.awesome_icon                              = theme_assets.awesome_icon(
    theme.menu_height, theme.fg_normal, theme.bg_normal
)

-- Generate taglist squares:
local taglist_square_size                       = dpi(0)
theme.taglist_squares_sel                       = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel                     = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Try to determine if we are running light or dark colorscheme:
local bg_numberic_value                         = 0;
for s in theme.bg_normal:gmatch("[a-fA-F0-9][a-fA-F0-9]") do
    bg_numberic_value = bg_numberic_value + tonumber("0x" .. s);
end
local is_dark_bg = (bg_numberic_value < 383)

return theme
