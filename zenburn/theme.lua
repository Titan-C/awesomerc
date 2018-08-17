-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

-- Alternative icon sets and widget icons:
--  * http://awesome.naquadah.org/wiki/Nice_Icons
local util = require('awful.util')
-- {{{ Main
local theme = {}
local themes_dir = util.getdir("config") .. "/zenburn"
theme.wallpaper = themes_dir .. "/wallpapers/landscape.jpg"
-- }}}

-- {{{ Styles
theme.font      = "DejaVuSansMono 14"

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

local gears = require("gears")
local lain  = require("lain")
local wibox = require("wibox")
local awful = require("awful")

local markup = lain.util.markup

-- Create a textclock widget
local mytextclock = wibox.widget.textclock()
--local mytextclock = wibox.widget.textclock(markup("#7788af", "%A %d %B ") .. markup("#535f7a", ">") .. markup("#de5e1e", " %H:%M "))
mytextclock.font = theme.font
-- calendar
lain.widget.calendar({
      attach_to = { mytextclock },
      notification_preset = {
        font = theme.font,
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

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
        elseif mpd_now.state == "pause" then
            artist = " mpd "
            title  = "paused "
        else
            artist = ""
            title  = ""
            theme.mpdicon:set_image(theme.widget_music)
        end
        widget:set_markup(markup.font(theme.font, markup("#FF8466", artist) .. " " .. title))
    end
})

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_battery)
local batwidget = lain.widget.bat({
    battery = "BAT1",
    ac = "ACAD",
    settings = function()
        if bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                widget:set_markup(markup.font(theme.font, " AC " .. bat_now.perc .. "% "))
                baticon:set_image(theme.widget_ac)
                return
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                baticon:set_image(theme.widget_battery_empty)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                baticon:set_image(theme.widget_battery_low)
            else
                baticon:set_image(theme.widget_battery)
            end
            widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
        else
            baticon:set_image(theme.widget_ac)
        end
    end
})

function theme.set_wallpaper(s)
    -- Wallpaper
    if theme.wallpaper then
        local wallpaper = theme.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Separators
local separators = lain.util.separators
local arrl_dl = separators.arrow_left(theme.bg_focus, "alpha")
local arrl_ld = separators.arrow_left("alpha", theme.bg_focus)

function theme.at_screen_connect(s)
    -- Wallpaper
    theme.set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "", "", "", "", "", ""}, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            arrl_ld,
            wibox.container.background(theme.mpd.widget, theme.bg_focus),
            wibox.container.background(theme.mpdicon, theme.bg_focus),
            arrl_dl,
            wibox.widget.systray(),
            arrl_ld,
            wibox.container.background(baticon, theme.bg_focus),
            wibox.container.background(batwidget.widget, theme.bg_focus),
            arrl_dl,
            mytextclock,
            arrl_ld,
            wibox.container.background(s.mylayoutbox, theme.bg_focus),
        },
    }
end

return theme
