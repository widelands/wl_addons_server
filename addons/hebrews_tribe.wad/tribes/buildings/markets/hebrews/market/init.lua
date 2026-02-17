push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_market_type {
   name = "hebrews_market",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Market"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      clay = 4,
      granite = 6,
      branch = 3,
   },
   return_on_dismantle = {
      clay = 2,
      granite = 3,
   },

   local_carrier = "hebrews_carrier",
   trade_carrier = "hebrews_donkey",

   animations = {
      idle = {
         hotspot = { 88, 105 },
      },
   },

   aihints = {
      prohibited_till = 1000,
      forced_after = 1500,
   },
}

pop_textdomain()
