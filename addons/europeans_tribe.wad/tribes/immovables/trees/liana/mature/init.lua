push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "liana_wasteland_mature",
   -- TRANSLATORS: This is a fictitious tree. Be creative if you want.
   descname = _("Liana Tree (Mature)"),
   size = "small",
   animation_directory = dirname,
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:1m12s",
         "remove=chance:7.42%",
         "seed=liana_wasteland_sapling proximity:2.72%",
         "animate=idle duration:30s",
         "remove=chance:7.42%",
         "grow=liana_wasteland_old",
      },
   },
   spritesheets = {
      idle = {
         basename = "mature",
         fps = 8,
         frames = 5,
         rows = 3,
         columns = 2,
         hotspot = { 18, 48 }
      }
   },
}

pop_textdomain()
