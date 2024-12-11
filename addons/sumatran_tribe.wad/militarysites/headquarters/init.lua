push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_warehouse_type {
   name = "sumatran_headquarters",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Headquarters"),
   icon = dirname .. "menu.png",
   size = "big",
   destructible = false,

   animation_directory = dirname,
   spritesheets = {
      idle = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 90, 96 }
      },
   },

   aihints = {},

   heal_per_second = 220,
   conquers = 9,
   max_garrison = 20,
}

pop_textdomain()
