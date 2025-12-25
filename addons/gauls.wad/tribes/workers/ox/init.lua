push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_carrier_type {
   name = "gauls_carrier_1",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("gauls_worker", "Ox"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   ware_hotspot = { -2, 21 },

   spritesheets = {
      idle = {
         fps = 20,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 10, 25 }
      },
      walk = {
         fps = 20,
         frames = 20,
         rows = 5,
         columns = 4,
         directional = true,
         hotspot = { 21, 31 }
      },
      walkload = {
         basename = "walk",
         fps = 20,
         frames = 20,
         rows = 5,
         columns = 4,
         directional = true,
         hotspot = { 21, 31 }
      },
   },
}

pop_textdomain()
