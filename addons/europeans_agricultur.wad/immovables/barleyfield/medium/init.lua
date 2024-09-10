push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "barleyfield_medium",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Barley Field (medium)"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:60s",
         "transform=barleyfield_ripe",
      },
      grow = {
         "animate=idle duration:30s",
         "transform=barleyfield_ripe",
      }
   },
   
   animation_directory = dirname,
   animations = {
      idle = {
         basename = "idle",
         hotspot = {21, 33}
      }
   }
}

pop_textdomain()
