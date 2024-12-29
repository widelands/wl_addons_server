push_textdomain("sumatran_world.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "ironwood_amazons_old",
   -- TRANSLATORS:  This is an Amazon rare tree.
   descname = _("Ironwood Tree (Old)"),
   -- TRANSLATORS:  This is an Amazon rare tree.
   species = _("Ironwood Tree"),
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:25m35s",
         "transform=deadtree7 chance:0.89%",
         "seed=ironwood_amazons_sapling proximity:19.53%",
      },
      fall = {
         "remove=",
      },
   },
   icon = dirname .. "../menu.png",
   animation_directory = dirname,
   spritesheets = {
   idle = {
      basename = "ironwood_old",
      hotspot = {25, 62},
      fps = 8,
      frames = 4,
      columns = 2,
      rows = 2
   },
 }
}

pop_textdomain()
