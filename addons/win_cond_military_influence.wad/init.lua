local wc_functions = include(path.dirname(__file__) .. "functions.lua")

local wc_dir = "win_cond_military_influence.wad"
push_textdomain(wc_dir, true)

local wc_def = {
   name = "Military Influence",
   description = _("Conquer as much land as you can and train as many and strong soldiers as you can in the set time."),
   peaceful_mode_allowed = true,
   configurable_time = true,
   textdomain = wc_dir,
   init = wc_functions[1],
   func = wc_functions[2],
}

pop_textdomain()
return wc_def
