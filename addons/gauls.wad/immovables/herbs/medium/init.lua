push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "herbs_medium",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Herbs (medium)"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:50s",
         "transform=herbs_ripe",
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
