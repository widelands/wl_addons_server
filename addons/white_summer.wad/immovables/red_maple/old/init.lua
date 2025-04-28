push_textdomain("white_summer.wad", true)

dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "red_maple_summer_old",
   descname = _"Red Maple (Old)",
   species = _"Red Maple",
   icon = dirname .. "../menu.png",
   size = "small",

   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:31m57s",
         "transform=deadtree4 chance:9.22%",
         "seed=red_maple_summer_sapling proximity:30%",
      },
      fall = {
         "remove=",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "red_maple_old",
         fps = 9,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 24, 55 },
         sound_effect = {
            path = "sound/animals/crickets1",
            priority = "10%"
         },
      }
   },
}

pop_textdomain()
