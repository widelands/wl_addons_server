push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_bakery",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Bakery"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 2,
      planks = 2,
      granite = 3
   },
   return_on_dismantle = {
      planks = 1,
      granite = 2
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 54, 74 },
      },
   },

   spritesheets = {
      working = {
         fps = 20,
         frames = 5,
         columns = 5,
         rows = 1,
         hotspot = { 54, 74 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 720
   },

   working_positions = {
      lutas_atlanteans_baker = 1
   },

   inputs = {
      { name = "water", amount = 8 },
      { name = "cornmeal", amount = 4 },
      { name = "blackroot_flour", amount = 4 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start baking bread because ...
         descname = pgettext("lutas_atlanteans_building", "baking bread"),
         actions = {
            -- time total: 34.8 + 30 + 2 * 3.6 = 72 sec
            "return=skipped unless economy needs atlanteans_bread",
            "consume=water:2 blackroot_flour cornmeal",
            "animate=working duration:34s800ms",
            "sleep=duration:30s",
            "produce=atlanteans_bread:2"
         }
      },
   },
}

pop_textdomain()
