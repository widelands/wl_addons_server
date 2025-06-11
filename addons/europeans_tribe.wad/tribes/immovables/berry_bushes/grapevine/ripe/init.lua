push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type {
   name = "grapevine_ripe",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Grapevine (ripe)"),
   icon = dirname .. "menu.png",
   terrain_affinity = terrain_affinity,
   size = "small",
   programs = {
      main = {
         "animate=idle duration:7m30s",
         "remove=",
      },
      harvest = {
         "remove=",
      }
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 15, 18 },
      },
   }
}

pop_textdomain()
