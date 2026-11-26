include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/empire/headquarters/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_warehouse_type {
   name = "europeans_empire_headquarters",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Headquarters"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "big",
   destructible = false,

   aihints = {
      prohibited_till = 21600,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1
   },

   heal_per_second = 220,
   conquers = 9,
   max_garrison = 20,
}

pop_textdomain()
