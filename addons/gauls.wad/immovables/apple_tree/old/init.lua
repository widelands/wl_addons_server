push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "apple_tree_old",
   -- TRANSLATORS:  This is a Gauls fruit tree.
   descname = _("Apple Tree (Old)"),
   -- TRANSLATORS:  This is a Gauls fruit tree.
   species = _("Apple Tree"),
   icon = dirname .. "menu.png",
   size = "small",
   animation_directory = dirname,
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:1m35s",
         "transform=deadtree5 chance:3.89%",
         "grow=apple_tree_flowering",
      },
      fall = {
         "remove=",
      },
   },
   spritesheets = {
   idle = {
      basename = "apple_tree_old",
      hotspot = {32, 62},
      fps = 6,
      frames = 4,
      columns = 2,
      rows = 2
   },
 }
}

pop_textdomain()
