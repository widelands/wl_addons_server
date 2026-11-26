include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/markets/empire/market/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_market_type {
   name = "europeans_empire_market",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Market"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "big",
   buildcost = {
      log = 3,
      planks = 2,
      granite = 2,
      marble = 2,
      marble_column = 2,
      cloth = 2,
   },
   return_on_dismantle = {
      log = 1,
      planks = 1,
      granite = 1,
      marble = 2,
      cloth = 1,
   },

   local_carrier = "empire_carrier",
   trade_carrier = "empire_donkey",

   aihints = {
      prohibited_till = 7200,
      forced_after = 14400,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1
   },
}

pop_textdomain()
