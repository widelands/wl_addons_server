push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_market_type {
   name = "sumatran_market",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Market"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 3,
      tropicalwood = 3,
      granite = 4,
      diamond = 1,
      cloth = 3,
   },
   return_on_dismantle = {
      log = 2,
      tropicalwood = 1,
      granite = 2,
      cloth = 1,
   },

   local_carrier = "sumatrans_carrier",
   trade_carrier = "sumatran_carrier_1",

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


   aihints = {
      prohibited_till = 1000,
      forced_after = 1500,
   },
}

pop_textdomain()