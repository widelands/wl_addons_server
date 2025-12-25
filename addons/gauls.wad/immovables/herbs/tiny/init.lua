push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "herbs_tiny",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Herbs (tiny)"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:30s",
         "transform=herbs_small",
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
