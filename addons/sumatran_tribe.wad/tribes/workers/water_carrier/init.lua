push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "sumatran_water_carrier",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("sumatran_worker", "Water Carrier"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      sumatrans_carrier = 1,
      buckets = 1
   },

   programs = {
      bring_water = {
         "findspace=size:swim radius:8",
         "walk=coords",
         "animate=freeing duration:1s",
         "createware=water",
         "return"
      }
   },

   animations = {
      idle = {
         hotspot = { 8, 22 }
      },
   },

   spritesheets = {
      freeing = {
         fps = 10,
         frames = 30,
         rows = 6,
         columns = 5,
         hotspot = { 10, 19 }
      },
      walk = {
         fps = 20,
         frames = 20,
         rows = 5,
         columns = 4,
         directional = true,
         hotspot = { 11, 23 }
      },
   },
}

pop_textdomain()
