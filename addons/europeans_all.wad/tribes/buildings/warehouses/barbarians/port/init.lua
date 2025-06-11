push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/barbarians/port/"

wl.Descriptions():new_warehouse_type {
   name = "europeans_barbarians_port",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("barbarians_building", "Port"),
   icon = dirname .. "menu.png",
   size = "port",
   map_check = {"seafaring"},

   buildcost = {
      log = 3,
      blackwood = 3,
      granite = 5,
      grout = 2,
      iron = 2,
      reed = 4,
      gold = 2
   },
   return_on_dismantle = {
      log = 1,
      blackwood = 2,
      granite = 3,
      grout = 1,
      iron = 1,
      reed = 1,
      gold = 1
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 66, 80 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 59, 77 }
      },
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
