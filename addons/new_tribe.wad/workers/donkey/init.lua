push_textdomain("new_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_carrier_type {
   name = "newtribe_donkey",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("newtribe_worker", "Donkey"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   ware_hotspot =  { -2, 8 },

   animations = {
      idle = {
         hotspot = { 14, 20 },
         fps = 10
      },
      walk = {
         hotspot = { 14, 25 },
         fps = 10,
         directional = true
      },
      walkload = {
         basename = "walk",
         hotspot = { 14, 25 },
         fps = 10,
         directional = true
      }
   }
}

pop_textdomain()
