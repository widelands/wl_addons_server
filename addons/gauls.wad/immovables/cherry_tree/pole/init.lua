push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "cherry_tree_pole",
   -- TRANSLATORS:  This is a Gauls fruit tree.
   descname = _("Cherry Tree (Pole)"),
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:1m05s",
         "remove=chance:9.37%",
         "grow=cherry_tree_mature",
      },
   },
   icon = dirname .. "menu.png",
   animation_directory = dirname,
   spritesheets = { idle = {
   basename = "cherry_tree_pole",
   hotspot = {14, 37},
   fps = 8,
   frames = 4,
   columns = 2,
   rows = 2
}}
}

pop_textdomain()
