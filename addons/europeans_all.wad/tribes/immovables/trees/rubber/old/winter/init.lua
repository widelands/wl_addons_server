push_textdomain("europeans_all.wad", true)

local dirname = path.dirname(__file__) .. "../"

include(dirname .. "../terrain_affinity.lua")
include(dirname .. "../spritesheets.lua")

wl.Descriptions():new_immovable_type{
   name = "rubber_winter_old",
   -- TRANSLATORS:  This is an Amazon rare tree.
   descname = _("Rubber Tree (Old)"),
   -- TRANSLATORS:  This is an Amazon rare tree.
   species = _("Rubber Tree"),
   size = "small",
   terrain_affinity = terrain_affinity_winter,
   programs = {
      main = {
         "animate=idle duration:25m35s",
         "transform=deadtree7 chance:12.89%",
         "seed=rubber_winter_sapling proximity:19.53%",
      },
      grow = {
         "animate=idle duration:25m35s",
         "transform=deadtree7 chance:6.44%",
         "seed=rubber_winter_sapling proximity:19.53%",
      },
      fall = {
         "animate=fall duration:1s",
         "remove=",
      },
   },
   icon = dirname .. "menu_old.png",
   animation_directory = dirname,
   spritesheets = spritesheet_old
}

pop_textdomain()
