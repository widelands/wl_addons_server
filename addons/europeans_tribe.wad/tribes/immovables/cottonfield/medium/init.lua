push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname (__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type {
   name = "cottonfield_medium",
   descname = _("Cotton Field (medium)"),
   size = "small",
   icon = dirname .. "menu.png",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:26s",
         "grow=cottonfield_ripe",
      },
      grow = {
         "animate=idle duration:13s",
         "grow=cottonfield_ripe",
      },
   },
   
   animation_directory = dirname,
   spritesheets = {
      idle = {
         hotspot = {17, 40},
         frames = 4,
         columns = 2,
         rows = 2,
      }
   }
}

pop_textdomain()
