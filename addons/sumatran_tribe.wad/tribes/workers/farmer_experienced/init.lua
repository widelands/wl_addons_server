push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "sumatran_farmer_experienced",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("sumatran_worker", "Experienced Farmer"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   programs = {
      check = {
         "findspace=size:any radius:3 space",
      },
      plant = {
         "findspace=size:any radius:3 space",
         "walk=coords",
         "animate=planting duration:5s",
         "plant=attrib:seed_cassavaplants",
         "animate=planting duration:5s",
         "return"
      },
      harvest = {
         "findobject=attrib:ripe_cassavaplants radius:3",
         "walk=object",
         "animate=harvesting duration:5s",
         "callobject=harvest",
         "animate=gathering duration:5s",
         "createware=cassavaroot",
         "return"
      }
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
