push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "lutas_atlanteans_toolsmith",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("lutas_atlanteans_worker", "Toolsmith"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      lutas_atlanteans_carrier = 1,
      saw = 1
   },

   animations = {
      idle = {
         hotspot = { 10, 21 }
      },
   },

   spritesheets = {
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 8, 23 }
      },
      walkload = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 8, 23 }
      },
   },
}

pop_textdomain()
