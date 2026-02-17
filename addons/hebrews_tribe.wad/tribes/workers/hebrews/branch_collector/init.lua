push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "hebrews_branch_collector",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("hebrews_worker", "Branch Collector"),
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      hebrews_carrier = 1
   },

   programs = {
      collect = {
         "findobject=attrib:tree radius:8",
         "walk=object",
         "animate=idle duration:6s",
         "createware=branch",
         "return"
      }
   },

   animation_directory = dirname,
   ware_hotspot = {0, 20},
   spritesheets = {
      idle = {
         fps = 10,
         frames = 95,
         rows = 11,
         columns = 9,
         hotspot = { 7, 22 }
      },
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 7, 20 }
      },
      walkload = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 8, 21 }
      },
   }
}

pop_textdomain()
