push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "gauls_farmer",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("gauls_worker", "Farmer"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      gauls_carrier = 1,
      scythe = 1
   },

   programs = {
      plant = {
         -- steps from building: 2-6, average 3.66
         -- min. worker time: 2 * 2 * 1.8 + 17 = 34.2 sec
         -- max. worker time: 2 * 6 * 1.8 + 17 = 48.6 sec
         -- avg. worker time: 2 * 3.66 * 1.8 + 17 = 40.2 sec
         "findspace=size:any radius:2 space",
         "walk=coords",
         "animate=planting duration:12s",
         "plant=attrib:seed_wheat",
         "animate=planting duration:5s",
         "return"
      },
      harvest = {
         -- steps from building: 2-6, average 3.66
         -- min. worker time: 2 * 2 * 1.8 + 17 = 34.2 sec
         -- max. worker time: 2 * 6 * 1.8 + 17 = 48.6 sec
         -- avg. worker time: 2 * 3.66 * 1.8 + 17 = 40.2 sec
         "findobject=attrib:ripe_wheat radius:2",
         "walk=object",
         "animate=harvesting duration:12s",
         "callobject=harvest",
         "animate=gathering duration:5s",
         "createware=wheat_sheaf",
         "return"
      },
      plant_reed = {
         -- steps from building: 2-9, average 5.5
         -- min. worker time: 2 * 2 * 1.8 + 10 = 17.2 sec
         -- max. worker time: 2 * 9 * 1.8 + 10 = 42.4 sec
         -- avg. worker time: 2 * 5.5 * 1.8 + 10 = 29.8 sec
         "findspace=size:swim radius:6",
         "walk=coords",
         "animate=planting duration:5s",
         "plant=attrib:seed_reed",
         "animate=planting duration:5s",
         "return"
      },
      harvest_reed = {
         -- steps from building: 2-9, average 5.5
         -- min. worker time: 2 * 2 * 1.8 + 14 = 21.2 sec
         -- max. worker time: 2 * 9 * 1.8 + 14 = 46.4 sec
         -- avg. worker time: 2 * 5.5 * 1.8 + 14 = 33.8 sec
         "findobject=attrib:ripe_reed radius:6",
         "walk=object",
         "animate=harvesting duration:10s",
         "callobject=harvest",
         "animate=gathering duration:4s",
         "createware=reed",
         "return"
      },
   },

   animations = {
      idle = {
         hotspot = { 9, 24 }
      },
   },

   spritesheets = {
      planting = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 13, 32 }
      },
      harvesting = {
         fps = 10,
         frames = 15,
         rows = 5,
         columns = 3,
         hotspot = { 13, 32 }
      },
      gathering = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 13, 32 }
      },
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 13, 24 }
      },
      walkload = {
         basename = "walk",
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 13, 24 }
      },
   },
}

pop_textdomain()
