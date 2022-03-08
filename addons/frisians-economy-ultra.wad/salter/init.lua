dirname = path.dirname (__file__)

push_textdomain("frisians-economy-ultra.wad", true)

wl.Descriptions():new_worker_type {
   name = "frisians_salter",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext ("frisians_worker", "Salter"),
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
         "animate=dig duration:30s",
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
pop_textdomain()
