push_textdomain("tribes")

dirname = path.dirname (__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type {
   name = "cottonfield_small",
   descname = _("Cotton Field (small)"),
   size = "small",
   icon = dirname .. "menu.png",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:18s",
         "grow=cottonfield_medium",
      },
      grow = {
         "animate=idle duration:9s",
         "grow=cottonfield_medium",
      },
   },
   
   animation_directory = dirname,
   spritesheets = {
      idle = {
         hotspot = {14, 32},
         frames = 4,
         columns = 2,
         rows = 2,
      }
   }
}

pop_textdomain()
