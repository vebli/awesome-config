local wibox = require("wibox")
local beautiful = require("beautiful")
local tag_groups = require("state.tag_groups")

local tag_group_widget = wibox.widget {
    text   = tag_groups.current,
    align  = "center",
    valign = "center",
    widget = wibox.widget.textbox
}

-- Update when group changes
awesome.connect_signal("tag_group::changed", function(group)
    tag_group_widget.text = group
end)

return tag_group_widget
