push_textdomain("sumatran_world.wad")

local dirname = path.dirname(__file__)

wl.Descriptions():new_critter_type {
   name = "rhinoceros",
   descname = _("Rhinoceros"),
   icon = dirname .. "menu.png",
   animation_directory = dirname,
   programs = {
      remove = { "remove" },
   },
   size = 10,
   reproduction_rate = 60,


   animation_directory = dirname,
   spritesheets = {
      eating = {
         basename = "idle",
         fps = 10,
         frames = 10,
         columns = 5,
         rows = 2,
--         directional = true,
         hotspot = {14, 22}
      },
      walk = {
         fps = 10,
         frames = 10,
         columns = 5,
         rows = 2,
         directional = true,
         hotspot = {20, 20}
      },
      idle = {
         fps = 10,
         frames = 10,
         columns = 5,
         rows = 2,
         hotspot = {14, 22}
      },
   },
}

pop_textdomain()
