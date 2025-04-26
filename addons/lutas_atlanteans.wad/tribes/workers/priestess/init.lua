push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "lutas_atlanteans_priestess",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("lutas_atlanteans_worker", "Priestess"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 3,

   buildcost = {
      lutas_atlanteans_carrier = 1,
      tabard = 1
   },

   programs = {
      attract_shells = {
         -- steps from building to water: 2-19, min+max average 14
         -- min. worker time: 2 * 2 * 1.8 + 5 = 12.2 sec
         -- max. worker time: 2 * 13 * 1.8 + 5 = 51.8 sec
         -- avg. worker time: 2 * 10 * 1.8 + 5 = 41 sec
         "findspace=size:swim radius:13",
         "walk=coords",
         "animate=idle duration:5s",
         "plant=attrib:seashell",
         "return"
      }
   },

   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 12, 27 }
      },
      walk = {
         fps = 10,
         frames = 10,
         columns = 10,
         rows = 1,
         directional = true,
         hotspot = { 12, 27 }
      },
   }
}

pop_textdomain()
