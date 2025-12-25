push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "apple_tree_sapling",
   -- TRANSLATORS:  This is a Gauls fruit tree.
   descname = _("Apple Tree (Sapling)"),
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:55s",
         "remove=chance:13.67%",
         "grow=apple_tree_pole",
      },
   },
   icon = dirname .. "menu.png",
   animation_directory = dirname,
   spritesheets = { idle = {
   basename = "apple_tree_sapling",
   hotspot = {9, 22},
   fps = 3,
   frames = 4,
   columns = 2,
   rows = 2
}}
}

pop_textdomain()
