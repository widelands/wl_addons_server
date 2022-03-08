dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "ryefield_tiny",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Rye Field (tiny)"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:150s",
         "transform=ryefield_small",
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
