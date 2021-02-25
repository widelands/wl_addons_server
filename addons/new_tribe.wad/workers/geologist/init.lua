push_textdomain("new_tribe.wad", true)

dirname = path.dirname (__file__)

descriptions:new_worker_type {
   name = "newtribe_geologist",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext ("newtribe_worker", "Geologist"),
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      newtribe_carrier = 1,
      tool = 1
   },

   programs = {
      expedition = {
         "repeatsearch=search repetitions:15 radius:5"
      },
      search = {
         "animate=hacking duration:4s",
         "animate=idle duration:2s",
         "animate=hacking duration:4s",
         "findresources"
      }
   },

   animation_directory = dirname,
   spritesheets = {
      walk = {
         directional = true,
         hotspot = {17, 28},
         fps = 15,
         frames = 30,
         columns = 6,
         rows = 5
      },
      idle = {
         hotspot = {10, 28},
         fps = 15,
         frames = 30,
         columns = 6,
         rows = 5
      },
      hacking = {
         hotspot = {10, 23},
         fps = 15,
         frames = 30,
         columns = 6,
         rows = 5
      },
   },
}

pop_textdomain()
