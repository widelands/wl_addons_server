push_textdomain("sumatran_world.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "balsa_winter_amazons_old",
   descname = _("Balsa Tree Winter (removed)"),
--   species = _("Balsa Tree Winter (removed)"),
   icon = dirname .. "../menu.png",
   size = "small",
   animation_directory = dirname,
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:13m20s",
         "transform=deadtree5 chance:19.53%",
      },
      fall = {
         "remove=",
      },
   },
   spritesheets = {
   idle = {
      basename = "balsa_old",
      hotspot = {32, 62},
      fps = 6,
      frames = 4,
      columns = 2,
      rows = 2
     },
   },
}

pop_textdomain()
