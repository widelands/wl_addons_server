push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "vegetable_medium",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Vegetable (medium)"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:50s",
         "transform=vegetable_ripe",
      }
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         hotspot = {24, 29},
         frames = 4,
         columns = 2,
         rows = 2,
         fps = 8
      }
   }
}

pop_textdomain()
