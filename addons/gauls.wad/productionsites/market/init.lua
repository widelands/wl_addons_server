push_textdomain("gauls.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_market_type {
   name = "gauls_market",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Market"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 3,
      planks = 3,
      granite = 4,
      bronze = 1,
      cloth = 3
   },
   return_on_dismantle = {
      log = 2,
      planks = 1,
      granite = 2,
      bronze = 1,
      cloth = 1
   },

   local_carrier = "gauls_carrier",
   trade_carrier = "gauls_carrier_1",

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
      forced_after = 2400,
   },
}

pop_textdomain()