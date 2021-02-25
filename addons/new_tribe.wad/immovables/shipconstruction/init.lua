push_textdomain("new_tribe.wad", true)

dirname = path.dirname (__file__)

descriptions:new_immovable_type {
   name = "newtribe_shipconstruction",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Ship Under Construction"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "construct=idle duration:5s decay_after:3m30s",
         "transform=bob:newtribe_ship",
      }
   },
   buildcost = {
      log = 18,
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "build",
         hotspot = {75, 141},
         frames = 6,
         columns = 3,
         rows = 2,
         fps = 1,
         representative_frame = 3
      },
   }
}

pop_textdomain()
