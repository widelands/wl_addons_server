dirname = path.dirname(__file__)

push_textdomain("europeans_tribe.wad", true)

wl.Descriptions():new_immovable_type {
   name = "oatfield_tiny",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Oat Field (tiny)"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:30s",
         "transform=oatfield_small",
      },
      grow = {
         "animate=idle duration:15s",
         "transform=oatfield_small",
      }
   },
   animations = {
      idle = {
         directory = dirname,
         basename = "idle",
         hotspot = {21, 13}
      }
   }
}
pop_textdomain()
