push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "hebrews_shipconstruction",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("hebrews_immovable", "Ship Under Construction"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "construct=idle duration:5s decay_after:3m30s",
         "transform=bob:hebrews_ship",
      }
   },
   buildcost = {
      branch = 10,
      cloth = 4
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         fps = 1,
         frames = 7,
         rows = 4,
         columns = 2,
         representative_frame = 5,
         hotspot = { 79, 73 }
      },
   }
}

pop_textdomain()
