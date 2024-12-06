push_textdomain("sumatran_world.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "rubber_amazons_mature",
   -- TRANSLATORS:  This is an Amazon rare tree.
   descname = _("Rubber Tree (Mature)"),
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:1m12s",
         "remove=chance:7.42%",
         "grow=rubber_amazons_old",
      },
   },
   icon = dirname .. "../menu.png",
   animation_directory = dirname,
   spritesheets = { idle = {
   basename = "rubber_mature",
   hotspot = {24, 64},
   fps = 6,
   frames = 4,
   columns = 2,
   rows = 2
}}
}

pop_textdomain()
