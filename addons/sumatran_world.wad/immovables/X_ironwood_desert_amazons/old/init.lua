push_textdomain("sumatran_world.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type{
   name = "ironwood_desert_amazons_old",
   descname = _(""),
   species = _(""),
   icon = dirname .. "../menu.png",
   size = "small",
   animation_directory = dirname,
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:13m20s",
         "transform=deadtree5 chance:19.53%",
      },
   },
   spritesheets = {
      idle = {
         basename = "old",
         fps = 10,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 24, 60 },
         sound_effect = {
            path = "sound/animals/crickets2",
            priority = "10%"
         },
      }
   },
}

pop_textdomain()
