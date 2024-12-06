push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "cassavaplants_small",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Cassava Plants (small)"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:45s",
         "transform=cassavaplants_medium",
      }
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         hotspot = {22, 40},
         frames = 4,
         columns = 2,
         rows = 2,
         fps = 8
      }
   }
}

pop_textdomain()
