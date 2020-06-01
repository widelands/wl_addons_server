dirname = path.dirname (__file__)

tribes:new_worker_type {
   msgctxt = "frisians_worker",
   name = "frisians_salter",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext ("frisians_worker", "Salter"),
   helptext_script = dirname .. "helptexts.lua",
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      frisians_carrier = 1,
      shovel = 1
   },

   ware_hotspot = {0, 20},

   programs = {
      make_salt = {
         "findspace=size:swim radius:4",
         "walk=coords",
         "animate=dig 30000",
         "createware=salt",
         "return"
      }
   },

   spritesheets = {
      walk = {
         directory = dirname,
         basename = "walk",
         fps = 15,
         frames = 10,
         columns = 5,
         rows = 2,
         directional = true,
         hotspot = {11, 24}
      },
      walkload = {
         directory = dirname,
         basename = "walkload",
         fps = 15,
         frames = 10,
         columns = 5,
         rows = 2,
         directional = true,
         hotspot = {10, 26}
      },
      dig = {
         directory = dirname,
         basename = "dig",
         fps = 20,
         frames = 10,
         columns = 5,
         rows = 2,
         hotspot = {15, 20}
      },
   },
   animations = {
      idle = {
         directory = dirname,
         basename = "idle",
         hotspot = {8, 23}
      },
   },
}
