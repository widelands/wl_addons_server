push_textdomain("sumatran_world.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "rubber_amazons_pole",
   -- TRANSLATORS:  This is an Amazon rare tree.
   descname = _("Rubber Tree (Pole)"),
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:1m05s",
         "remove=chance:9.37%",
         "grow=rubber_amazons_mature",
      },
      grow = {
         "animate=idle duration:33s",
         "grow=rubber_amazons_mature",
      },
   },
   icon = dirname .. "../menu.png",
   animation_directory = dirname,
   spritesheets = { idle = {
   basename = "rubber_pole",
   hotspot = {20, 42},
   fps = 6,
   frames = 4,
   columns = 2,
   rows = 2
}}
}

pop_textdomain()
