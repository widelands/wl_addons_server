dirname = path.dirname(__file__)

descriptions:new_immovable_type {
   name = "oatfield_ripe",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Oat Field (ripe)"),
   size = "small",
   icon = dirname .. "menu.png",
   programs = {
      main = {
         "animate=idle duration:2500s",
         "remove=",
      },
      harvest = {
         "transform=oatfield_harvested"
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
