push_textdomain("tribes")

dirname = path.dirname (__file__)

descriptions:new_worker_type {
   name = "europeans_claydigger_normal",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext ("europeans_worker", "Normal Clay Digger"),
   icon = dirname .. "menu.png",
   vision_range = 2,
   
   experience = 24,
   becomes = "europeans_claydigger_advanced",

   programs = {
      check_dike = {
         "findspace=size:swim radius:12 terraform:diking",
      },
      dike = {
         "findspace=size:swim radius:12 terraform:diking",
         "walk=coords",
         "animate=dig duration:4s",
         "terraform=diking",
         "return"
      },
      check_dig = {
         "findspace=size:any radius:12 avoid:field",
      },
      dig = {
         "findspace=size:any radius:12 avoid:field",
         "walk=coords",
         "animate=dig duration:4s",
         "plant=attrib:pond_dry",
         "return"
      }
   },

   ware_hotspot = {0, 20},
   
   animations = {
      idle = {
         directory = dirname,
         basename = "idle",
         hotspot = {8, 23}
      },
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
   }
}

pop_textdomain()