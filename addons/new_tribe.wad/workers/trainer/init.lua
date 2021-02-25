push_textdomain("new_tribe.wad", true)

dirname = path.dirname (__file__)

descriptions:new_worker_type {
   name = "newtribe_trainer",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext ("newtribe_worker", "Trainer"),
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      newtribe_carrier = 1,
      tool = 1
   },

   animation_directory = dirname,
   ware_hotspot = {0, 29},
   spritesheets = {
      walk = {
         directional = true,
         hotspot = {17, 28},
         fps = 15,
         frames = 30,
         columns = 6,
         rows = 5
      },
      walkload = {
         directional = true,
         hotspot = {17, 31},
         fps = 15,
         frames = 30,
         columns = 6,
         rows = 5
      },
      idle = {
         basename = "walk_se",
         hotspot = {17, 28},
         fps = 15,
         frames = 30,
         columns = 6,
         rows = 5
      },
   },
}

pop_textdomain()
