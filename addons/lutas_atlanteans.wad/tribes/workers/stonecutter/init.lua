push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "lutas_atlanteans_stonecutter",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("lutas_atlanteans_worker", "Stonecutter"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      lutas_atlanteans_carrier = 1,
      pick = 1
   },

   programs = {
      cut_granite = {
         -- steps from building to rock: 2-9, min+max average 5.5
         -- min. worker time: 2 * 2 * 1.8 + 18.5 = 25.7 sec
         -- max. worker time: 2 * 9 * 1.8 + 18.5 = 50.9 sec
         -- avg. worker time: 2 * 5.5 * 1.8 + 18.5 = 38.3 sec
         "findobject=attrib:rocks radius:6",
         "walk=object",
         "playsound=sound/atlanteans/cutting/stonecutter priority:50% allow_multiple",
         "animate=hacking duration:18s500ms",
         "callobject=shrink",
         "createware=granite",
         "return"
      }
   },

   animations = {
      idle = {
         hotspot = { 7, 20 }
      },
   },

   spritesheets = {
      hacking = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         hotspot = { 10, 19 }
      },
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 10, 21 }
      },
      walkload = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 10, 23 }
      },
   },
}

pop_textdomain()
