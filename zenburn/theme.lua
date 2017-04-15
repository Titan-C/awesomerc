-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

-- Alternative icon sets and widget icons:
--  * http://awesome.naquadah.org/wiki/Nice_Icons
local util = require('awful.util')
-- {{{ Main
local theme = {}
themes_dir = util.getdir("config") .. "/zenburn"
theme.wallpaper = themes_dir .. "/wallpapers/landscape.jpg"
-- }}}

-- {{{ Styles
theme.font      = "DejaVuSansMono 12"

-- {{{ Colors
theme.fg_normal  = "#DCDCCC"
theme.fg_focus   = "#F0DFAF"
theme.fg_urgent  = "#CC9393"
theme.bg_normal  = "#3F3F3F"
theme.bg_focus   = "#1E2320"
theme.bg_urgent  = "#3F3F3F"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.border_width  = 2
theme.border_normal = "#3F3F3F"
theme.border_focus  = "#6F6F6F"
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = 15
theme.menu_width  = 100
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = themes_dir .. "/taglist/squarefz.png"
theme.taglist_squares_unsel = themes_dir .. "/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = themes_dir .. "/awesome-icon.png"
theme.menu_submenu_icon      = themes_dir .. "/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = themes_dir .. "/layouts/tile.png"
theme.layout_tileleft   = themes_dir .. "/layouts/tileleft.png"
theme.layout_tilebottom = themes_dir .. "/layouts/tilebottom.png"
theme.layout_tiletop    = themes_dir .. "/layouts/tiletop.png"
theme.layout_fairv      = themes_dir .. "/layouts/fairv.png"
theme.layout_fairh      = themes_dir .. "/layouts/fairh.png"
theme.layout_spiral     = themes_dir .. "/layouts/spiral.png"
theme.layout_dwindle    = themes_dir .. "/layouts/dwindle.png"
theme.layout_max        = themes_dir .. "/layouts/max.png"
theme.layout_fullscreen = themes_dir .. "/layouts/fullscreen.png"
theme.layout_magnifier  = themes_dir .. "/layouts/magnifier.png"
theme.layout_floating   = themes_dir .. "/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = themes_dir .. "/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_dir .. "/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = themes_dir .. "/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_dir .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = themes_dir .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_dir .. "/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = themes_dir .. "/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_dir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = themes_dir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_dir .. "/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = themes_dir .. "/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_dir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = themes_dir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_dir .. "/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = themes_dir .. "/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_dir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themes_dir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_dir .. "/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

theme.widget_ac             = themes_dir .. "/icons/ac.png"
theme.widget_battery        = themes_dir .. "/icons/battery.png"
theme.widget_battery_low    = themes_dir .. "/icons/battery_low.png"
theme.widget_battery_empty  = themes_dir .. "/icons/battery_empty.png"

theme.widget_music          = themes_dir .. "/icons/note.png"
theme.widget_music_on       = themes_dir .. "/icons/note_on.png"

local lain  = require("lain")
local wibox = require("wibox")
local awful = require("awful")

local markup = lain.util.markup

-- MPD
theme.mpdicon = wibox.widget.imagebox(theme.widget_music)
theme.mpdicon:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.spawn.with_shell("mpc next") end),
    awful.button({ }, 3, function () awful.spawn.with_shell("mpc toggle") end)))

theme.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
            theme.mpdicon:set_image(theme.widget_music_on)
            widget:set_markup(markup.font(theme.font, markup("#FF8466", artist) .. " " .. title))
        elseif mpd_now.state == "pause" then
            artist = " mpd "
            title  = "paused "
        else
            artist = ""
            title  = ""
            theme.mpdicon:set_image(theme.widget_music)
        end
        -- widget:set_markup(artist .. title)
    end
})

return theme
