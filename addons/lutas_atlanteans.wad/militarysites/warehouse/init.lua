push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_warehouse_type {
   name = "lutas_atlanteans_warehouse",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Warehouse"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 1,
      planks = 4,
      granite = 2,
      quartz = 2,
      spidercloth = 1
   },
   return_on_dismantle = {
      log = 1,
      planks = 2,
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
      prohibited_till = 1200
   },

   heal_per_second = 170,
}

pop_textdomain()
