push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type {
   name = "grapevine_small",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Grapevine (small)"),
   icon = dirname .. "menu.png",
   terrain_affinity = terrain_affinity,
   size = "small",
   programs = {
      main = {
         "animate=idle duration:30s",
         "transform=grapevine_medium",
      },
      grow = {
         "animate=idle duration:15s",
         "transform=grapevine_medium",
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
