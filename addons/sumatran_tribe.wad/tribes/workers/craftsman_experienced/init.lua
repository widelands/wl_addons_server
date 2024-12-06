push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "sumatran_craftsman_experienced",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("sumatran_worker", "Experienced Craftsman"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   animations = {
      idle = {
         hotspot = { 3, 22 },
      }
   },
   spritesheets = {
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 6, 22 }
      },
      walkload = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 9, 23 }
      }
   },
}

pop_textdomain()
