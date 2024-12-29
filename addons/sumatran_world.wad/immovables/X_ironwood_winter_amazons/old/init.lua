push_textdomain("sumatran_world.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "ironwood_winter_amazons_old",
   descname = _("Ironwood Tree Winter (removed)"),
   species = _("Ironwood Tree Winter (removed)"),
   icon = dirname .. "../menu.png",
   size = "small",
   animation_directory = dirname,
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:13m20s",
         "transform=deadtree7 chance:19.53%",
      },
      fall = {
         "remove=",
      },
   },
   spritesheets = {
   idle = {
      basename = "ironwood_old",
      hotspot = {25, 62},
      fps = 8,
      frames = 4,
      columns = 2,
      rows = 2
     },
   },
}

pop_textdomain()
