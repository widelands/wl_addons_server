push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname (__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type {
   name = "berry_bush_sea_buckthorn_tiny",
   descname = _("Sea Buckthorn (tiny)"),
   size = "small",
   icon = dirname .. "menu.png",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:14s",
         "grow=berry_bush_sea_buckthorn_small",
      },
      grow = {
         "animate=idle duration:7s",
         "grow=berry_bush_sea_buckthorn_small",
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
