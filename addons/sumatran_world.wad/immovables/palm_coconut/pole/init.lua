push_textdomain("sumatran_world.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "palm_coconut_desert_pole",
   descname = _("Coconut Palm (Pole)"),
   size = "small",
   animation_directory = dirname,
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:55s",
         "remove=chance:12.89%",
         "grow=palm_coconut_desert_mature",
      },
   },
   spritesheets = {
      idle = {
         basename = "pole",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 12, 28 }
      }
   },
}

pop_textdomain()
