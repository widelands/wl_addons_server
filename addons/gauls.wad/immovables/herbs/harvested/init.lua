push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "herbs_harvested",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Herbs (harvested)"),
   icon = dirname .. "menu.png",
   programs = {
      main = {
         "animate=idle duration:5m",
         "remove=",
      },
      harvest = {
         "remove=",
      }
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 36, 49 },
      },
   }
}

pop_textdomain()
