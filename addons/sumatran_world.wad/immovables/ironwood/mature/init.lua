push_textdomain("sumatran_world.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "ironwood_amazons_mature",
   -- TRANSLATORS:  This is an Amazon rare tree.
   descname = _("Ironwood Tree (Mature)"),
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:1m12s",
         "remove=chance:7.42%",
         "grow=ironwood_amazons_old",
      },
   },
   icon = dirname .. "../menu.png",
   animation_directory = dirname,
   spritesheets = { idle = {
   basename = "ironwood_mature",
   hotspot = {19, 54},
   fps = 8,
   frames = 4,
   columns = 2,
   rows = 2
}}
}

pop_textdomain()
