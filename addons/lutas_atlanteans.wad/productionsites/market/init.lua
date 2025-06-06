push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_market_type {
   name = "lutas_atlanteans_market",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Market"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
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

   local_carrier = "lutas_atlanteans_carrier",
   trade_carrier = "lutas_atlanteans_horse",

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
