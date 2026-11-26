include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/frisians/port/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_warehouse_type {
   name = "europeans_frisians_port",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("europeans_building", "Port"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

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
      cloth = 1,
      reed = 2,
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
