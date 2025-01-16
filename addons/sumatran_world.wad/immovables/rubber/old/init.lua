push_textdomain("sumatran_world.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")


wl.Descriptions():new_immovable_type{
   name = "rubber_amazons_old",
   -- TRANSLATORS:  This is an Amazon rare tree.
   descname = _("Rubber Tree (Old)"),
   -- TRANSLATORS:  This is an Amazon rare tree.
   species = _("Rubber Tree"),
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:25m35s",
         "transform=deadtree5 chance:12.89%",
         "seed=rubber_amazons_sapling proximity:19.53%",
      },
      grow = {
         "animate=idle duration:25m35s",
         "transform=deadtree5 chance:12.89%",
         "seed=rubber_amazons_sapling proximity:19.53%",
      },
      fall = {
         "remove=",
      },
   },
   icon = dirname .. "../menu.png",
   animation_directory = dirname,
   spritesheets = {
   idle = {
      basename = "rubber_old",
      hotspot = {31, 75},
      fps = 6,
      frames = 4,
      columns = 2,
      rows = 2
   },
 }
}

pop_textdomain()
