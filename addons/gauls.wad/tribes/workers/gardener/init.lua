push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "gauls_gardener",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("gauls_worker", "Gardener"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      gauls_carrier = 1,
      shovel = 1,
      basket = 1,
   },

    experience = 27,
    becomes = "gauls_gardener_experienced",

   programs = {
      plant_herbs = {
         -- steps from building: 2-5, average 11.2
         -- avg. worker time: 11.2 + 13 = 24.2 sec
         "findspace=size:any radius:2 space",
         "walk=coords",
         "animate=dig duration:8s",
         "plant=attrib:seed_herbs",
         "animate=gathering duration:5s",
         "return"
      },
      plant_vegetable = {
         -- steps from building: 2-5, average 11.2
         -- avg. worker time: 11.2 + 13 = 24.2 sec
         "findspace=size:any radius:2 space",
         "walk=coords",
         "animate=dig duration:8s",
         "plant=attrib:seed_vegetable",
         "animate=gathering duration:5s",
         "return"
      },
      harvest_herbs = {
         -- steps from building: 2-5, average 11.2
         -- avg. worker time: 11.2 + 6 = 17.2 sec
         "findobject=attrib:ripe_herbs radius:2",
         "walk=object",
         "animate=gathering duration:5s",
         "callobject=harvest",
         "animate=gathering duration:1s",
         "createware=herbs",
         "return"
      },
      harvest_vegetable = {
         -- steps from building: 2-5, average 11.2
         -- avg. worker time: 11.2 + 6 = 17.2 sec
         "findobject=attrib:ripe_vegetable radius:2",
         "walk=object",
         "animate=gathering duration:5s",
         "callobject=harvest",
         "animate=gathering duration:1s",
         "createware=vegetable",
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
      gathering = {
         hotspot = {11, 18},
         fps = 15,
         frames = 15,
         columns = 5,
         rows = 3
      },
      dig = {
         basename = "gathering",
         hotspot = {11, 18},
         fps = 15,
         frames = 15,
         columns = 5,
         rows = 3
      }
   },
}

pop_textdomain()
