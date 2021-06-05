push_textdomain("tribes")

dirname = path.dirname(__file__)

descriptions:new_worker_type {
   name = "europeans_trainer_normal",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("europeans_worker", "Normal Trainer"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   experience = 24,
   becomes = "europeans_trainer_advanced",

   animations = {
      idle = {
         hotspot = { 11, 21 }
      },
      walk = {
         hotspot = { 14, 21 },
         fps = 10,
         directional = true
      },
      walkload = {
         basename = "walk",
         hotspot = { 14, 21 },
         fps = 10,
         directional = true
      }
   }
}

pop_textdomain()
