push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "cassavaplants_harvested",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Cassava Plants (harvested)"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:6m",
         "remove=",
      },
      harvest = {
         "remove=",
      }
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = {22, 40},
      }
   }
}

pop_textdomain()
