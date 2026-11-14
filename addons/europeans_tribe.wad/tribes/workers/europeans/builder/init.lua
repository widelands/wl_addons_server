push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/workers/atlanteans/builder/"

wl.Descriptions():new_worker_type {
   name = "europeans_builder",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("atlanteans_worker", "Builder"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      europeans_carrier = 1,
      hammer = 1
   },

   spritesheets = {
      idle = {
         fps = 10,
         frames = 150,
         rows = 13,
         columns = 12,
         hotspot = { 13, 23 }
      },
      work = {
         sound_effect = {
            path = "sound/hammering/hammering",
            priority = "50%"
         },
         fps = 10,
         frames = 92,
         rows = 11,
         columns = 9,
         hotspot = { 5, 21 }
      },
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 8, 24 }
      },
      walkload = {
         basename = "walk",
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 8, 24 }
      },
   },
}

pop_textdomain()
