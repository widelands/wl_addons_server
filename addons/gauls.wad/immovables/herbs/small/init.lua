push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "herbs_small",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Herbs (small)"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:45s",
         "transform=herbs_medium",
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
