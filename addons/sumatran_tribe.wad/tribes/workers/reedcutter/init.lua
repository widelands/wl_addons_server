push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "sumatran_reedcutter",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("sumatran_worker", "Reedcutter"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      sumatrans_carrier = 1,
      machete = 1
   },

   programs = {
      plant = {
         -- steps from building to rock: 2-9, average 5.5
         -- min. worker time: 2 * 2 * 1.8 + 10 = 17.2 sec
         -- max. worker time: 2 * 9 * 1.8 + 10 = 42,4 sec
         -- avg. worker time: 2 * 5.5 * 1.8 + 10 = 29,8 sec
         "findspace=size:swim radius:6",
         "walk=coords",
         "animate=planting duration:5s",
         "plant=attrib:seed_reed",
         "animate=planting duration:5s",
         "return"
      },
      harvest = {
         -- steps from building to rock: 2-9, average 5.5
         -- min. worker time: 2 * 2 * 1.8 + 14 = 21.2 sec
         -- max. worker time: 2 * 9 * 1.8 + 14 = 46,4 sec
         -- avg. worker time: 2 * 5.5 * 1.8 + 14 = 33,8 sec
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
         hotspot = { 10, 23 },
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
         frames = 10,
         rows = 4,
         columns = 3,
         hotspot = { 18, 32 }
      },
      gathering = {
         fps = 5,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 10, 34 }
      },
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 18, 23 }
      },
      walkload = {
         basename = "walk",
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 18, 23 }
      },
   },
}

pop_textdomain()
