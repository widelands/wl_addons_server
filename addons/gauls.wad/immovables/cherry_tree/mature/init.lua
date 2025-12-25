push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "cherry_tree_mature",
   -- TRANSLATORS:  This is a Gauls fruit tree.
   descname = _("Cherry Tree (Mature)"),
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:1m12s",
         "remove=chance:7.42%",
         "grow=cherry_tree_old",
      },
   },
   icon = dirname .. "menu.png",
   animation_directory = dirname,
   spritesheets = { idle = {
   basename = "cherry_tree_mature",
   hotspot = {19, 54},
   fps = 8,
   frames = 4,
   columns = 2,
   rows = 2
}}
}

pop_textdomain()
