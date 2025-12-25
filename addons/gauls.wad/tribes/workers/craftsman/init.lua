push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "gauls_craftsman",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("gauls_worker", "Craftsman"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      gauls_carrier = 1,
      hammer = 1,
   },

    experience = 18,
    becomes = "gauls_blacksmith",

   animations = {
      idle = {
         hotspot = { 6, 28 }
      },
   },

   spritesheets = {
      walk = {
         fps = 15,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 11, 24 }
      }
   },
}

pop_textdomain()
