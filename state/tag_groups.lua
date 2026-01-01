local awful = require("awful")
local gears = require("gears")

local M = {}

M.groups = {
    General = { "G1", "G2", "G3", "G4", "G5" },
    Study   = { "S1", "S2", "S3", "S4", "S5" },
    Code    = { "C1", "C2", "C3", "C4", "C5" },
}

function M.tag_filter(t)
    local group = M.groups[M.current]
    if not group then return false end
    return gears.table.hasitem(group, t.name)
end

M.current = "General"

function M.switch(group, s)
    if not M.groups[group] then return end
    s = s or awful.screen.focused()

    local first = awful.tag.find_by_name(s, M.groups[group][1])
    if first then
        first:view_only()
        M.current = group
        awesome.emit_signal("tag_group::changed", group)
    end
end

function M.tag_for_index(i, s)
    s = s or awful.screen.focused()
    local name = M.groups[M.current][i]
    if not name then return nil end
    return awful.tag.find_by_name(s, name)
end

return M
