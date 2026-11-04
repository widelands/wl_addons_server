push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__) .. "../"

include(dirname .. "../terrain_affinity.lua")
include(dirname .. "../spritesheets.lua")

wl.Descriptions():new_immovable_type{
   name = "rubber_winter_pole",
   -- TRANSLATORS:  This is an Amazon rare tree.
   descname = _("Rubber Tree (Pole)"),
   size = "small",
   terrain_affinity = terrain_affinity_winter,
   programs = {
      main = {
         "animate=idle duration:1m05s",
         "remove=chance:9.37%",
         "grow=rubber_winter_mature",
      },
      grow = {
         "animate=idle duration:33s",
         "grow=rubber_winter_mature",
      },
   },
   icon = dirname .. "menu_pole.png",
   animation_directory = dirname,
   spritesheets = spritesheet_pole
}

pop_textdomain()
