push_textdomain("sumatran_world.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_critter_type{
   name = "crocodile",
   descname = _("Crocodile"),
   icon = dirname .. "menu.png",
   animation_directory = dirname,
   programs = {
      remove = { "remove" },
   },
   size = 4,
   reproduction_rate = 10,
   appetite = 30,
   carnivore = true,

   animations = {
      idle = {
         hotspot = { 19, 17 }
      },
      eating = {
         basename = "idle", 
         hotspot = { 19, 17 }
      },
   },
   spritesheets = {
      walk = {
         fps = 20,
         frames = 20,
         rows = 5,
         columns = 4,
         directional = true,
         hotspot = { 13, 15 }
      },
   },

}

pop_textdomain()
