push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

include(dirname .. "../terrain_affinity.lua")

wl.Descriptions():new_immovable_type {
   name = "grapevine_tiny",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Grapevine (tiny)"),
   icon = dirname .. "menu.png",
   terrain_affinity = terrain_affinity,
   size = "small",
   programs = {
      main = {
         "animate=idle duration:25s",
         "transform=grapevine_small",
      },
      main = {
         "animate=idle duration:13s",
         "transform=grapevine_small",
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
