local awful = require("awful")
awful.spawn.with_shell("picom")
awful.spawn.with_shell("./screenlayout.sh")
-- awful.spawn.with_shell("nitrogen --restore &")

