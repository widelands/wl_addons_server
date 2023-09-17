push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "barleyfield_ripe",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Barley Field (ripe)"),
   size = "small",
   icon = dirname .. "menu.png",
   programs = {
      main = {
         "animate=idle duration:10m",
         "remove=",
      },
      harvest = {
         "transform=barleyfield_harvested"
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
