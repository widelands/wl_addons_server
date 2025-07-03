push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/workers/frisians/diker/"

wl.Descriptions():new_worker_type {
   name = "europeans_diker",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext ("europeans_worker", "Diker"),
   icon = dirname .. "menu.png",
   vision_range = 2,

   programs = {
      check_build = {
         "findspace=size:swim radius:32 terraform:diking",
      },
      check_dike = {
         "findobject=attrib:dike radius:32",
      },
      build = {
         -- steps from building to dike: 2-9
         -- min. worker time: 2 * 2 * 1.8 + 70 =  77.2 sec
         -- max. worker time: 2 * 9 * 1.8 + 70 = 102.4 sec
         "findspace=size:swim radius:32 terraform:diking",
         "walk=coords",
         "animate=work duration:30s",
         "plant=attrib:dike",
         "return"
      },
      dike = {
         -- steps from building to dike: 2-9
         -- min. worker time: 2 * 2 * 1.8 + 3 * 30 =  97.2 sec
         -- max. worker time: 2 * 9 * 1.8 + 3 * 30 = 122.4 sec
         "findobject=attrib:dike radius:32",
         "walk=object",
         "animate=work duration:10s",
         "callobject=maybe_remove",
         "animate=work duration:10s",
         "terraform=diking",
         "animate=work duration:10s",
         "return"
      },
   },

   buildcost = {
      europeans_carrier = 1,
   },

   ware_hotspot = {0, 20},

   animation_directory = dirname,
   spritesheets = {
      walk = {
         fps = 15,
         frames = 10,
         columns = 5,
         rows = 2,
         directional = true,
         hotspot = {11, 24}
      },
      walkload = {
         fps = 15,
         frames = 10,
         columns = 5,
         rows = 2,
         directional = true,
         hotspot = {10, 26}
      },
      work = {
         fps = 20,
         frames = 10,
         columns = 5,
         rows = 2,
         hotspot = {15, 20}
      },
   },
   animations = {idle = {hotspot = {8, 26}}}
}

pop_textdomain()
