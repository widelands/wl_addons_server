push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/barbarians/warehouse/"

wl.Descriptions():new_warehouse_type {
   name = "europeans_barbarians_warehouse",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("barbarians_building", "Warehouse"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 3,
      blackwood = 2,
      granite = 2,
      grout = 3,
      reed = 1
   },
   return_on_dismantle = {
      log = 1,
      blackwood = 1,
      granite = 1,
      grout = 1
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         rows = 1,
         columns = 1,
         hotspot = { 60, 78 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 60, 78 }
      },
   },

   aihints = {
      prohibited_till = 18000,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1
   },

   heal_per_second = 170,
}

pop_textdomain()
