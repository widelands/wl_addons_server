push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__) .. "../"

include(dirname .. "../terrain_affinity.lua")
include(dirname .. "../spritesheets.lua")

wl.Descriptions():new_immovable_type{
   name = "balsa_black_mature",
   -- TRANSLATORS:  This is an Amazon rare tree.
   descname = _("Balsa Tree (Mature)"),
   size = "small",
   terrain_affinity = terrain_affinity_black,
   programs = {
      main = {
         "animate=idle duration:1m12s",
         "remove=chance:7.42%",
         "seed=balsa_black_sapling proximity:2.72%",
         "animate=idle duration:30s",
         "remove=chance:7.42%",
         "grow=balsa_black_old",
      },
      grow = {
         "animate=idle duration:36s",
         "grow=balsa_black_old",
      },
   },
   icon = dirname .. "menu_mature.png",
   animation_directory = dirname,
   spritesheets = spritesheet_mature
}

pop_textdomain()
