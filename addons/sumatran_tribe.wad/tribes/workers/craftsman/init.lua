push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "sumatran_craftsman",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("sumatran_worker", "Craftsman"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      sumatrans_carrier = 1,
      hammer = 1,
      whetstone = 1
   },

    experience = 25,
    becomes = "sumatran_craftsman_experienced",

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
