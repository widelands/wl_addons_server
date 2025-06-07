push_textdomain("tribes")

dirname = path.dirname (__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type {
   name = "cottonfield_tiny",
   descname = _("Cotton Field (tiny)"),
   size = "small",
   icon = dirname .. "menu.png",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:14s",
         "grow=cottonfield_small",
      },
      grow = {
         "animate=idle duration:7s",
         "grow=cottonfield_small",
      },
   },
   
   animation_directory = dirname,
   spritesheets = {
      idle = {
         hotspot = {9, 19},
         frames = 4,
         columns = 2,
         rows = 2,
      }
   }
}

pop_textdomain()
