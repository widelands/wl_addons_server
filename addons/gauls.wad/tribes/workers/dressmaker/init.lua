push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "gauls_dressmaker",
   -- TRANSLATORS: This is a worker name used in lists of workers, please use a female form
   descname = pgettext("gauls_worker", "Dressmaker"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,


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
