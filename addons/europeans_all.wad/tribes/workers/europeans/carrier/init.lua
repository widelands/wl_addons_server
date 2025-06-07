push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/workers/atlanteans/carrier/"

wl.Descriptions():new_carrier_type {
   name = "europeans_carrier",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("atlanteans_worker", "Carrier"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {}, -- This will give the worker the property "buildable"

   spritesheets = {
      idle = {
         fps = 10,
         frames = 50,
         rows = 8,
         columns = 7,
         hotspot = { 13, 24 }
      },
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 8, 25 }
      },
      walkload = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 8, 25 }
      },
   }
}

pop_textdomain()
