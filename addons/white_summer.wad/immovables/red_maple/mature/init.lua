push_textdomain("white_summer.wad", true)

dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "red_maple_summer_mature",
   descname = _"Red Maple (Mature)",
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:69s",
         "seed=red_maple_summer_sapling proximity:34%",
         "remove=chance:8.93%",
         "grow=red_maple_summer_old",
      },
   },
   icon = dirname .. "../menu.png",
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "red_maple_mature",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 18, 53 }
      }
   },
}

pop_textdomain()
