local gears = require("gears")
local theme_assets = require("beautiful.theme_assets")
local rnotification = require("ruled.notification")
local dpi   = require("beautiful.xresources").apply_dpi
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

-- inherit default theme
local theme = dofile(themes_path.."default/theme.lua")

-- load vector assets' generators for this theme
theme.prompt_bg_cursor = "#9CABCA"
theme.notification_spacing = dpi(6)

theme.logo = gears.color.recolor_image(config.bar.logotype.image, "#7FB4CA")

theme.systray_icon_spacing = dpi(5)
theme.rounding      = dpi(2)
theme.font          = "JetBrainsMonoNL Nerd Font Mono 12"
theme.font_type     = "JetBrainsMonoNL Nerd Font Mono"
theme.icon_font     = "Material Design Icons"

theme.bg_normal     = "#14151e"
theme.bg_focus      = "#658594"
theme.bg_urgent     = "#FF5D62"
theme.bg_minimize   = "#313244"--xrdb.color0
theme.bg_systray    = theme.bg_minimize

theme.fg_normal     = "#9CABCA"
theme.fg_focus      = theme.bg_normal
theme.fg_urgent     = theme.bg_normal
theme.fg_minimize   = theme.bg_normal

theme.useless_gap   = dpi(12)
theme.border_width  = dpi(3)
theme.border_color_normal = "#1F1F28"
theme.border_color_active = theme.bg_focus
theme.border_color_marked = "#98BB6"

theme.taglist_bg_focus = theme.bg_focus
theme.taglist_fg_focus = "#384b41"
theme.taglist_bg_occupied = "#9CABCA"
theme.taglist_fg_occupied = "#384b41"
theme.taglist_bg_empty = theme.bg_minimize
theme.taglist_fg_empty = theme.fg_normal

theme.color6 = "#9CABCA"
theme.color5 = "#957FB8"


theme.tooltip_fg = theme.fg_normal
theme.tooltip_bg = theme.bg_normal

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.fg_normal)

-- Recolor titlebar icons:

local function darker(color_value, darker_n)
    local result = "#"
    for s in color_value:gmatch("[a-fA-F0-9][a-fA-F0-9]") do
        local bg_numeric_value = tonumber("0x"..s) - darker_n
        if bg_numeric_value < 0 then bg_numeric_value = 0 end
        if bg_numeric_value > 255 then bg_numeric_value = 255 end
        result = result .. string.format("%2.2x", bg_numeric_value)
    end
    return result
end
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_normal, "normal"
)
theme = theme_assets.recolor_titlebar(
    theme, darker(theme.fg_normal, -60), "normal", "hover"
)
theme = theme_assets.recolor_titlebar(
    theme, "#E82424", "normal", "press"
)
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_focus, "focus"
)
theme = theme_assets.recolor_titlebar(
    theme, darker(theme.fg_focus, -60), "focus", "hover"
)
theme = theme_assets.recolor_titlebar(
    theme, "#E82424", "focus", "press"
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.fg_normal, theme.bg_normal
)

-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Try to determine if we are running light or dark colorscheme:

local bg_numberic_value = 0;
for s in theme.bg_normal:gmatch("[a-fA-F0-9][a-fA-F0-9]") do
    bg_numberic_value = bg_numberic_value + tonumber("0x"..s);
end
local is_dark_bg = (bg_numberic_value < 383)


-- Wallpaper
theme.wallpaper = "/home/kuper/.config/awesome/themes/kanagawa/wall.jpg"

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

return theme
