include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/markets/frisians/market/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_market_type {
   name = "europeans_frisians_market",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Market"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "big",
   buildcost = {
      brick = 5,
      granite = 4,
      log = 5,
      reed = 4
   },
   return_on_dismantle = {
      brick = 3,
      granite = 2,
      log = 2,
      reed = 1
   },

   local_carrier = "frisians_carrier",
   trade_carrier = "frisians_reindeer",

   aihints = {
      prohibited_till = 7200,
      forced_after = 14400,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1
   },
}

pop_textdomain()
