push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "cherry_tree_sapling",
   -- TRANSLATORS:  This is a Gauls fruit tree.
   descname = _("Cherry Tree (Sapling)"),
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:55s",
         "remove=chance:13.67%",
         "grow=cherry_tree_pole",
      },
   },
   icon = dirname .. "menu.png",
   animation_directory = dirname,
   spritesheets = { idle = {
   basename = "cherry_tree_sapling",
   hotspot = {10, 29},
   fps = 8,
   frames = 4,
   columns = 2,
   rows = 2
}}
}

pop_textdomain()
