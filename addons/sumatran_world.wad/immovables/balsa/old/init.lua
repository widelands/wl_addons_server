push_textdomain("sumatran_world.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "balsa_amazons_old",
   descname = _("Balsa Tree (Old)"),
   species = _("Balsa Tree"),
   icon = dirname .. "../menu.png",
   size = "small",
   animation_directory = dirname,
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:25m35s",
         "transform=deadtree7 chance:0.89%",
         "seed=balsa_amazons_sapling proximity:19.53%",
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
 }
}

pop_textdomain()
