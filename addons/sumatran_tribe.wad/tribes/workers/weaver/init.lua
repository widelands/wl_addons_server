push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "sumatran_weaver",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("sumatran_worker", "Weaver"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      sumatrans_carrier = 1
   },

    experience = 25,
    becomes = "sumatran_dressmaker",

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