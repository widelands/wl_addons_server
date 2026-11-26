include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/amazons/port/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_warehouse_type {
   name = "europeans_amazons_port",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("europeans_building", "Port"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "port",
   map_check = {"seafaring"},
   buildcost = {
      balsa = 3,
      granite = 2,
      quartz = 1,
      log = 4,
      rubber = 3,
      gold = 2,
      rope = 3
   },
   return_on_dismantle = {
      balsa = 2,
      granite = 1,
      log = 2,
      rubber = 1,
      rope = 2,
      scrap_metal_mixed = 1
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
