push_textdomain("gauls.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_immovable_type {
   name = "hole",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext ("immovable", "Hole"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:6m40s",
         "remove=",
      }
   },
   animations = {
      idle = {
         hotspot = {8, 5}
      }
   }
}

pop_textdomain()
