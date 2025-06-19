push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/markets/barbarians/market/"

wl.Descriptions():new_market_type {
   name = "europeans_barbarians_market",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Market"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 107, 102 }
      },
   },
   spritesheets = {
      build = {
         frames = 2,
         columns = 2,
         rows = 1,
         hotspot = { 107, 102 }
      }
   },

   size = "big",
   buildcost = {
      log = 3,
      blackwood = 3,
      granite = 5,
      grout = 3,
      reed = 4,
   },
   return_on_dismantle = {
      log = 2,
      blackwood = 1,
      granite = 3,
      grout = 1,
      reed = 1,
   },

   local_carrier = "barbarians_carrier",
   trade_carrier = "barbarians_ox",

   aihints = {
      prohibited_till = 7200,
      forced_after = 14400,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1
   },
}

pop_textdomain()
