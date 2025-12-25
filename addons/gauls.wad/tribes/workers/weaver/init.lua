push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "gauls_weaver",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("gauls_worker", "Weaver"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      gauls_carrier = 1
   },

    experience = 18,
    becomes = "gauls_dressmaker",

   animations = {
      idle = {
         hotspot = { 2, 22 }
      },
   },

   spritesheets = {
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 6, 23 }
      },
      walkload = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 9, 22 }
      },
   },
}

pop_textdomain()
