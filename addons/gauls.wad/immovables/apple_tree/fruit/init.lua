push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "apple_tree_fruit",
   -- TRANSLATORS:  This is a Gauls fruit tree.
   descname = _("Apple Tree (Fruit)"),
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:1m42s",
         "transform=deadtree5 chance:7.89%",
         "grow=apple_tree_old",
         "seed=apple_tree_sapling proximity:10.53%",
      },
      harvest = {
         "grow=apple_tree_old",
      },
      fall = {
         "remove=",
      },
   },
   icon = dirname .. "menu.png",
   animation_directory = dirname,
   spritesheets = { idle = {
   basename = "apple_tree_fruit",
   hotspot = {32, 62},
   fps = 6,
   frames = 4,
   columns = 2,
   rows = 2
}}
}

pop_textdomain()
