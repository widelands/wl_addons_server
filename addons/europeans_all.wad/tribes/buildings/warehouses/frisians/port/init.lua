push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/frisians/port/"

wl.Descriptions():new_warehouse_type {
   name = "europeans_frisians_port",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("europeans_building", "Port"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   size = "port",
   map_check = {"seafaring"},

   buildcost = {
      brick = 6,
      granite = 4,
      log = 6,
      cloth = 2,
      gold = 2,
      reed = 4
   },
   return_on_dismantle = {
      brick = 3,
      granite = 2,
      log = 3,
      gold = 1,
      cloth = 1,
      reed = 2
   },

   spritesheets = {
      idle = {
         hotspot = {64, 117},
         frames = 10,
         columns = 5,
         rows = 2,
         fps = 10
      }
   },
   animations = {
      build = {
         hotspot = {64, 117}
      }
   },

   aihints = {
      prohibited_till = 18000,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1
   },

   conquers = 5,
   heal_per_second = 170,
   max_garrison = 20,
}

pop_textdomain()
