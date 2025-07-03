push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/markets/empire/market/"

wl.Descriptions():new_market_type {
   name = "europeans_market",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Market"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 104, 97 }
      },
   },
   spritesheets = {
      build = {
         frames = 2,
         columns = 2,
         rows = 1,
         hotspot = { 104, 97 }
      }
   },

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

   local_carrier = "europeans_trader",
   trade_carrier = "europeans_carrier_horse",

   aihints = {
      prohibited_till = 3600,
      forced_after = 7200,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1
   },
}

pop_textdomain()
