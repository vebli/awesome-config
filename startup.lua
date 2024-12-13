local awful = require("awful")
awful.spawn.with_shell("~/.screenlayout/default.sh")
awful.spawn.with_shell("random-wallpaper")
awful.spawn.with_shell("picom --backend xrender")

