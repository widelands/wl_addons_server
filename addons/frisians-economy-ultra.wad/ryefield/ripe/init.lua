dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "ryefield_ripe",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Rye Field (ripe)"),
   size = "small",
   icon = dirname .. "menu.png",
   programs = {
      main = {
         "animate=idle duration:2500s",
         "remove=",
      },
      harvest = {
         "transform=ryefield_harvested"
      }
   },
   animations = {
      idle = {
         directory = dirname,
         basename = "idle",
         hotspot = {21, 34}
      }
   }
}
