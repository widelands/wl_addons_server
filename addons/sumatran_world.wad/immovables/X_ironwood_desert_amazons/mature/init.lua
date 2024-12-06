push_textdomain("sumatran_world.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "ironwood_desert_amazons_mature",
   descname = _(""),
   size = "small",
   animation_directory = dirname,
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:25s",
         "remove=chance:3.91%",
      },
   },
   spritesheets = {
      idle = {
         basename = "mature",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 18, 48 }
      }
   },
}

pop_textdomain()
