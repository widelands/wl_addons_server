push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
   name = "europeans_smoker_basic",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("europeans_worker", "Basic Smoker"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,
   
   experience = 16,
   becomes = "europeans_smoker_normal",

   animations = {
      idle = {
         hotspot = { 17, 22 }
      },
      walk = {
         hotspot = { 20, 22 },
         fps = 10,
         directional = true
      },
      walkload = {
         hotspot = { 20, 24 },
         fps = 10,
         directional = true
      }
   }
}

pop_textdomain()
