push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
   name = "europeans_gamekeeper_normal",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("europeans_worker", "Normal Gamekeeper"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   experience = 24,
   becomes = "europeans_gamekeeper_advanced",

   programs = {
      release = {
         "findspace=size:any radius:6",
         "walk=coords",
         "animate=releasein duration:3s",
         "createbob=bunny chamois deer moose reindeer sheep stag wildboar wisent",
         "animate=releaseout duration:3s",
         "return"
      }
   },

   animations = {
      idle = {
         hotspot = { 14, 22 }
      },
   },
   spritesheets = {
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 15, 22 }
      },
      releasein = {
         fps = 5,
         frames = 10,
         rows = 4,
         columns = 3,
         hotspot = { 15, 22 }
      },
      releaseout = {
         fps = 5,
         frames = 10,
         rows = 4,
         columns = 3,
         hotspot = { 15, 22 }
      }
   }
}

pop_textdomain()
