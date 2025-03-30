push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "wheatfield_small",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Wheat Field (small)"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:60s",
         "transform=wheatfield_medium",
      },
      grow = {
         "animate=idle duration:30s",
         "transform=wheatfield_medium",
      }
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 5,
         rows = 3,
         columns = 2,
         hotspot = { 31, 24 }
      },
   }
}

pop_textdomain()
