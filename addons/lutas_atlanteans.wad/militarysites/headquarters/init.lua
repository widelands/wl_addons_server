push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_warehouse_type {
   name = "lutas_atlanteans_headquarters",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Headquarters"),
   icon = dirname .. "menu.png",
   size = "big",
   destructible = false,

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 84, 117 },
      },
   },

   aihints = {},

   heal_per_second = 220,
   conquers = 9,
   max_garrison = 20,
}

pop_textdomain()
