include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/barbarians/port/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_warehouse_type {
   name = "europeans_barbarians_port",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Port"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

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
      reed = 1,
      scrap_iron = 1,
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
