push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "apple_tree_mature",
   -- TRANSLATORS:  This is a Gauls fruit tree.
   descname = _("Apple Tree (Mature)"),
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:1m12s",
         "remove=chance:7.42%",
         "grow=apple_tree_old",
      },
   },
   icon = dirname .. "menu.png",
   animation_directory = dirname,
   spritesheets = { idle = {
   basename = "apple_tree_mature",
   hotspot = {24, 57},
   fps = 6,
   frames = 4,
   columns = 2,
   rows = 2
}}
}

pop_textdomain()
