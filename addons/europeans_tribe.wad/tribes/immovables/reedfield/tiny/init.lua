push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "reedfield_tiny",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Reed Field (tiny)"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:20s",
         "transform=reedfield_small",
      },
      grow = {
         "animate=idle duration:10s",
         "transform=reedfield_small",
      }
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 5,
         rows = 3,
         columns = 2,
         hotspot = { 24, 20 }
      },
   }
}

pop_textdomain()
