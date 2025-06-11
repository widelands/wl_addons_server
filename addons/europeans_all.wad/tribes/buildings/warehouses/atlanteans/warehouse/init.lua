push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/atlanteans/warehouse/"

wl.Descriptions():new_warehouse_type {
   name = "europeans_atlanteans_warehouse",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("atlanteans_building", "Warehouse"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 2,
      planks = 2,
      granite = 2,
      quartz = 1,
      spidercloth = 1
   },
   return_on_dismantle = {
      log = 1,
      planks = 1,
      granite = 1,
      quartz = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 63, 68 }
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
