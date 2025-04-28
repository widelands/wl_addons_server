push_textdomain("white_summer.wad", true)

dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "red_maple_summer_pole",
   descname = _"Red Maple (Pole)",
   size = "small",

   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:66s",
         "remove=chance:9.37%",
         "grow=red_maple_summer_mature",
      },
   },
   icon = dirname .. "../menu.png",
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "red_maple_pole",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 12, 30 }
      }
   },
}

pop_textdomain()
