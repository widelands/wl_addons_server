push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_carrier_type {
   name = "europeans_carrier_1",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("europeans_worker", "Carrier 1"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {}, -- This will give the worker the property "buildable"

   animations = {
      idle = {
         hotspot = { 13, 24 },
         fps = 10
      },
      walk = {
         hotspot = { 8, 25 },
         fps = 10,
         directional = true
      },
      walkload = {
         hotspot = { 8, 25 },
         fps = 10,
         directional = true
      }
   }
}

pop_textdomain()
