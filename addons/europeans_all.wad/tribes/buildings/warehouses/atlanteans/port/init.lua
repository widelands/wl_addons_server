include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/atlanteans/port/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_warehouse_type {
   name = "europeans_atlanteans_port",
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
      planks = 3,
      granite = 4,
      diamond = 1,
      quartz = 1,
      spidercloth = 3,
      gold = 2
   },
   return_on_dismantle = {
      log = 1,
      planks = 1,
      granite = 2,
      spidercloth = 1,
      scrap_metal_mixed = 1
   },

   aihints = {
      prohibited_till = 7200
   },

   conquers = 5,
   heal_per_second = 170,
   max_garrison = 20,
}

pop_textdomain()
