-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
-- pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

local r = assert(io.open(".config/awesome/json/config.json", "r"))
local table = r:read("*all")
r:close()

config = require("json"):decode(table)

-- beautiful.init(gears.filesystem.get_configuration_dir() .. "theme/catppuccin/theme.lua")
local chosen_theme = "catppuccin"
local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme)
beautiful.init(theme_path)

terminal = "kitty -1"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

require "awful.autofocus"
require "core"
require "modules"
require "signal"

-- /autostart
awful.spawn.with_shell("bash ~/.config/awesome/autostart.sh")

--[[ todo:
Mic/sound bar widgets
ExtendDD config.json for tags/rounding/fonts/etc/logo image/timeformat/
More widgets for people! (weather/crypto/pcname/arch/pacman packages)
Take launcher from https://github.com/garado/cozy and GIGA IMPROVE THEM! && close launcher in win+shift+d
Addition to launcher: hidden flags/recent/starred | add themes to launcher and powermenu
Add signals ifs to config
Custom widgets color in json
Notifications limit pool
Do animations, when volume down/up, off/on
--]]
