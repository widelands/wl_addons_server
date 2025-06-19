push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/markets/atlanteans/market/"

wl.Descriptions():new_market_type {
   name = "europeans_atlanteans_market",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Market"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   
   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 85, 105 }
      }
   },
   spritesheets = {
      build = {
         frames = 2,
         columns = 2,
         rows = 1,
         hotspot = { 85, 105 }
      }
   },
   
   size = "big",
   buildcost = {
      log = 3,
      planks = 3,
      granite = 4,
      quartz = 1,
      spidercloth = 3,
   },
   return_on_dismantle = {
      log = 2,
      planks = 1,
      granite = 2,
      spidercloth = 1,
   },

   local_carrier = "atlanteans_carrier",
   trade_carrier = "atlanteans_horse",

   aihints = {
      prohibited_till = 7200,
      forced_after = 14400,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1
   },
}

pop_textdomain()
