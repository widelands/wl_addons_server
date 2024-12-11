push_textdomain("sumatran_world.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "ironwood_amazons_sapling",
   -- TRANSLATORS:  This is an Amazon rare tree.
   descname = _("Ironwood Tree (Sapling)"),
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:55s",
         "remove=chance:13.67%",
         "grow=ironwood_amazons_pole",
      },
   },
   icon = dirname .. "../menu.png",
   animation_directory = dirname,
   spritesheets = { idle = {
   basename = "ironwood_sapling",
   hotspot = {10, 29},
   fps = 8,
   frames = 4,
   columns = 2,
   rows = 2
}}
}

pop_textdomain()
