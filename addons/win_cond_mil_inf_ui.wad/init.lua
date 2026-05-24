if wl.Game == nil then
   return
end

local wc_info_icon = path.dirname(__file__) .. "info_mil_inf.png"

-- workaround for v1.3
local thistime = string.bformat("%d", math.random(0x7FFFFFFF))
local wc_info_registered_ = {}
wc_info_registered_[thistime] = false

function register_military_influence_info_once(t)
   if wc_info_registered_[t] then
      return
   end
   wc_info_registered_[t] = true
   register_military_influence_info_()
end

function register_military_influence_info_()
   if wl.Game().win_condition ~= "Military Influence" then
      return
   end

   push_textdomain("win_cond_mil_inf_ui.wad", true)
   local wc_info_label = _("Show info on score calculation")
   pop_textdomain()

   local mv = wl.ui.MapView()
   mv:set_keyboard_shortcut("win_condition_info", "show_wc_info()")
   mv:add_toolbar_plugin("show_wc_info()", wc_info_icon, wc_info_label, "", "win_condition_info")
   mv:update_toolbar()
end

local wlver = string.match(get_build_id(), "[0-9]*[.][0-9]*")
if string.len(wlver) < 3 then
   -- failure parsing the version, e.g. very old version (build-...)
   return
end

-- This script is run too early, we cannot get any info about the game yet.
-- Let's schedule actual work after the game is set up.

if string.len(wlver) == 3 and wlver + 0.0 >= 1.4 then
   wl.ui.MapView():add_plugin_timer(
      "register_military_influence_()", 1000, "setup_military_influence_info", 1
   )
else
   -- version 1.3 (or older, which is not guaranteed to work)
   -- plugin timers can not be stopped cleanly
   wl.ui.MapView():add_plugin_timer(
      string.bformat("register_military_influence_info_once(%s)", thistime), 3000
   )
end
