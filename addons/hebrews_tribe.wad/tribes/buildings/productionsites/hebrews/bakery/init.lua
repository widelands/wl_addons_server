push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_bakery",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Bakery"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      clay = 5,
      granite = 2,
      branch = 2,
   },
   return_on_dismantle = {
      clay = 2,
      granite = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 59, 75 },
      },
      unoccupied = {
         hotspot = { 59, 75 },
      },
      working = {
         hotspot = { 59, 75 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 500,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
   },

   working_positions = {
      hebrews_talmid = 1
   },

   inputs = {
      { name = "water", amount = 6 },
      { name = "flour", amount = 6 },
      { name = "olive_oil", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start baking bread because ...
         descname = pgettext("hebrews_building", "baking bread"),
         actions = {
            -- time total: 20.8 + 2 * (20 + 3.6) = 68 sec
            "return=skipped unless economy needs bread_hebrews",
            "consume=water:3 flour:3 olive_oil:1",
            "sleep=duration:20s800ms",
            "animate=working duration:20s",
            "produce=bread_hebrews",
            "animate=working duration:20s",
            "produce=bread_hebrews",
            "animate=working duration:20s",
            "produce=bread_hebrews",
            "animate=working duration:20s",
            "produce=bread_hebrews"
         }
      },
   },
}

pop_textdomain()
