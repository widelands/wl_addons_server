push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "vegetable_tiny",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Vegetable (tiny)"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:30s",
         "transform=vegetable_small",
      }
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         hotspot = {10, 9},
         frames = 4,
         columns = 2,
         rows = 2,
      }
   }
}

pop_textdomain()
