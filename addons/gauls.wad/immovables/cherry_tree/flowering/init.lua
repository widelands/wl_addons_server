push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "cherry_tree_flowering",
   -- TRANSLATORS:  This is a Gauls fruit tree.
   descname = _("Cherry Tree (Flowering)"),
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:1m12s",
         "transform=deadtree5 chance:2.89%",
         "grow=cherry_tree_fruit",
      },
      fall = {
         "remove=",
      },
   },
   icon = dirname .. "menu.png",
   animation_directory = dirname,
   spritesheets = {
   idle = {
      basename = "cherry_tree_flowering",
      hotspot = {25, 62},
      fps = 8,
      frames = 4,
      columns = 2,
      rows = 2
   },
 }
}

pop_textdomain()
