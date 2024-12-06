push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "sumatran_breeder",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("sumatran_worker", "Breeder"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      sumatrans_carrier = 1,
   },


   animations = {
      idle = {
         hotspot = { 9, 24 }
      },
   },

   spritesheets = {
      planting = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 13, 32 }
      },
      harvesting = {
         fps = 10,
         frames = 15,
         rows = 5,
         columns = 3,
         hotspot = { 13, 32 }
      },
      gathering = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 13, 32 }
      },
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 13, 24 }
      },
      walkload = {
         basename = "walk",
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 13, 24 }
      },
   },
}

pop_textdomain()
