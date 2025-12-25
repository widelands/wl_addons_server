push_textdomain("gauls.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_worker_type {
   name = "gauls_brickmaker",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext ("gauls_worker", "Brick Maker"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      gauls_carrier = 1,
      shovel = 1,
      buckets = 1
   },

   ware_hotspot = {0, 20},

   spritesheets = {
      walk = {
         fps = 15,
         frames = 10,
         columns = 5,
         rows = 2,
         directional = true,
         hotspot = {13, 23}
      },
      walkload = {
         fps = 15,
         frames = 10,
         columns = 5,
         rows = 2,
         directional = true,
         hotspot = {10, 23}
      },
   },
   animations = {
      idle = {
         hotspot = {8, 23}
      },
   },
}

pop_textdomain()
