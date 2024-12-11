push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_worker_type {
   name = "sumatran_winemaker",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext ("sumatran_worker", "Winemaker"),
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      sumatrans_carrier = 1,
      machete = 1,
      buckets = 1
   },

   programs = {
      harvest = {
         "findobject=attrib:palm_tree radius:8",
         "walk=object",
         "animate=work duration:8s",
         "createware=palm_wine",
         "return"
      }
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
      work = {
         hotspot = {19, 35},
         fps = 15,
         frames = 15,
         columns = 5,
         rows = 3
      },
   }
}

pop_textdomain()
