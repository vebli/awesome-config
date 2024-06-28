local awful = require("awful")
local debug = require("debug")

-- Function to get the current script directory
local function get_current_script_dir()
    local info = debug.getinfo(1, "S")
    local script_path = info.source:sub(2) -- remove the @ character
    return script_path:match("(.*/)")
end

-- Get the directory of the current script
local script_dir = get_current_script_dir()

-- Run picom
awful.spawn.with_shell("picom")

-- Run the screenlayout script using the relative path
awful.spawn.with_shell(script_dir .. "screenlayout.sh")
