push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/warehouses/empire/headquarters/"

wl.Descriptions():new_warehouse_type {
   name = "europeans_empire_headquarters",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("empire_building", "Headquarters"),
   icon = dirname .. "menu.png",
   size = "big",
   destructible = false,

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 100, 115 },
      },
   },

   aihints = {
      prohibited_till = 21600,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1
   },

   heal_per_second = 220,
   conquers = 9,
   max_garrison = 20,
}

pop_textdomain()
