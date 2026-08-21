if wl.Game == nil then
   return
end

local function wc_good()
   return wl.Game().win_condition == "Military Influence"
end

-- This script is run too early for new games and replays, when we cannot get any info about the game yet.

-- It's is just crazy, but win_condition="Not set" is reported in localised form until the game is properly set up.
push_textdomain("widelands")
local no_wc = _("Not set")
pop_textdomain()

if not wc_good() and wl.Game().win_condition ~= no_wc then
   -- we know the win condition, but it's not "Military Influence"
   return
end

local wc_info_icon = path.dirname(__file__) .. "info_mil_inf.png"

function register_military_influence_info_()
   if not wc_good() then
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

-- Easy case on game loading: the win condition is already known when this script is run.
if wc_good() then
   register_military_influence_info_()
   return
end

-- We don't know the win condition yet. Let's schedule actual work after the game is set up.
-- However we can't start a coroutine for sleep() yet, so we have to use a plugin timer.
-- Single use timers are only possible from v1.4, so we need to check the version first.

local wlver = string.match(get_build_id(), "[0-9]*[.][0-9]*")
if string.len(wlver) < 3 then
   -- failure parsing the version, e.g. very old version (build-...)
   return
end

if string.len(wlver) == 3 and wlver + 0.0 >= 1.4 then
   wl.ui.MapView():add_plugin_timer(
      "register_military_influence_info_()", 1000, "setup_military_influence_info", 1
   )

else
   -- version 1.3 (or older, which is not guaranteed to work)
   -- There's no way to tell whether we'd already registered a keyboard shortcut or a
   -- toolbar plugin, and it's an error to do it again.
   -- Plugin timers can not be stopped cleanly.
   -- Any state variable or function we use will be saved with the game and overwritten
   -- on loading.
   -- Even random is unseeded and there's no way to initialise it or to get the realtime.
   -- So we need some dirty hack:
   -- We create a UI panel on start-up as a marker that we're not finished yet.

   local check_name = "check_win_condition"

   wl.ui.MapView():create_child({
      name = check_name,
      widget = "textarea",
      text = " ",  -- invisible
      font = "wui_info_panel_paragraph"
   })

   function register_military_influence_info_once_()
      local check = wl.ui.MapView():get_child(check_name)
      if check == nil then
         return
      end
      check:die()
      register_military_influence_info_()
   end

   wl.ui.MapView():add_plugin_timer(string.bformat("register_military_influence_info_once_()"), 3000)
end
