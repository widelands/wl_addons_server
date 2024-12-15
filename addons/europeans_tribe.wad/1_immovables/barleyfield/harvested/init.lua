push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "barleyfield_harvested",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Barley Field (harvested)"),
   icon = dirname .. "menu.png",
   programs = {
      main = {
         "animate=idle duration:7m30s",
         "remove=",
      }
   },
   
   animation_directory = dirname,
   animations = {
      idle = {
         basename = "idle",
         hotspot = {21, 34}
      }
   }
}

pop_textdomain()
