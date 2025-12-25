-- Imports
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox     = require("wibox")
local beautiful = require("beautiful")
local naughty   = require("naughty")
local lain      = require("lain")
local mytable   = awful.util.table or gears.table     -- 4.{0,1} compatibility



require("core.globals")
require("core.error")
require("core.startup")

-- beautiful.init(string.format("%s/.config/awesome/ui/themes/custom/theme.lua", os.getenv("HOME")))
beautiful.init(string.format("%s/.config/awesome/ui/themes/multicolor/theme.lua", os.getenv("HOME")))

require("ui.bar")
require("ui.layout")
require("ui.menu")

require("bindings.keys")
require("core.rules")
require("core.signals")


awful.util.terminal = terminal
awful.util.tagnames = { "1", "2", "3", "4", "5" }

-- {{{ Screen

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)

-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal("arrange", function(s)
    local only_one = #s.tiled_clients == 1
    for _, c in pairs(s.clients) do
        if only_one and not c.floating or c.maximized or c.fullscreen then
            c.border_width = 0
        else
            c.border_width = beautiful.border_width
        end
    end
end)

awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)

-- }}}
