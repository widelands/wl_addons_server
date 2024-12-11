push_textdomain("sumatran_world.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "dipterocarpus_mature",
   descname = _("Dipterocarpus (Mature)"),
   size = "small",
   animation_directory = dirname,
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:1m",
         "remove=chance:8.98%",
         "grow=dipterocarpus_old",
      },
   },
   spritesheets = {
      idle = {
         basename = "mature",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 30, 63 }
      }
   },
}

pop_textdomain()
