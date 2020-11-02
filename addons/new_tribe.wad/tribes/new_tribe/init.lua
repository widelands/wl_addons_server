dirname = path.dirname(__file__)
push_textdomain("new_tribe.wad", true)

local r = {
   -- Basic information for the New tribe
   name = "new_tribe",
   author = "Nordfriese",
   -- TRANSLATORS: This is a tribe name
   descname = _("New Tribe"),
   tooltip = _("A minimalistic tribe to demonstrate the possibility of creating custom tribes."),
   icon = dirname .. "icon.png",
   script = dirname .. "units.lua",

   starting_conditions = {
      dirname .. "headquarters.lua";
   }
}
pop_textdomain()
return r
