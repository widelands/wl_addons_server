push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/warehouses/empire/warehouse/"

wl.Descriptions():new_warehouse_type {
   name = "europeans_empire_warehouse",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("empire_building", "Warehouse"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 2,
      planks = 2,
      granite = 2,
      marble = 3,
      marble_column = 2
   },
   return_on_dismantle = {
      planks = 1,
      granite = 2,
      marble = 2,
      marble_column = 1
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 58, 58 }
      }
   },

   aihints = {
      prohibited_till = 18000,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1
   },

   heal_per_second = 170,
}

pop_textdomain()
