push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_warehouse_type {
   name = "gauls_headquarters",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Headquarters"),
   icon = dirname .. "menu.png",
   size = "big",
   destructible = false,

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 64, 106 }
      },
   },

   aihints = {},

   heal_per_second = 220,
   conquers = 9,
   max_garrison = 20,
}

pop_textdomain()
