push_textdomain("white_summer.wad", true)

dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "birch_summer_old",
   descname = _"Birch (Old)",
   species = _"Birch",
   icon = dirname .. "../menu.png",
   size = "small",

   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:18m57s",
         "transform=deadtree2 chance:10.22%",
         "seed=birch_summer_sapling proximity:25%",
      },
      fall = {
         "remove=",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "birch_old",
         fps = 7,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 23, 59 },
         sound_effect = {
            path = "sound/animals/bird4",
            priority = "10%"
         },
      }
   },
}

pop_textdomain()
