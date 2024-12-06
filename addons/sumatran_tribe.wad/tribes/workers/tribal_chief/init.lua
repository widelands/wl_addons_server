push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "sumatran_tribal_chief",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("sumatran_worker", "Tribal Chief"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   animations = {
      idle = {
         hotspot = { 6, 21 },
      }
   },
   spritesheets = {
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 10, 23 }
      }
   }
}

pop_textdomain()
