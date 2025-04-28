push_textdomain("white_summer.wad", true)

dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "pine_summer_mature",
   descname = _"Pine (Mature)",
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:74s",
         "seed=pine_summer_sapling proximity:34%",
         "remove=chance:6.93%",
         "grow=pine_summer_old",
      },
   },
   icon = dirname .. "../menu.png",
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "pine_mature",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 18, 53 }
      }
   },
}

pop_textdomain()
