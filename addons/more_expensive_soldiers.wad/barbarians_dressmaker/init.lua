push_textdomain("more_expensive_soldiers.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "barbarians_dressmaker",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("barbarians_worker", "Dressmaker"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,


   animations = {
      idle = {
         hotspot = { 5, 21 }
      }
   },
   spritesheets = {
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 7, 22 }
      },
      walkload = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 11, 27 }
      }
   }
}

pop_textdomain()
