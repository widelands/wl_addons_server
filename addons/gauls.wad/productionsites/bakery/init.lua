push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_bakery",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Bakery"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      granite = 2,
      planks = 2,
      brick = 2,
      reed = 1
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1,
      brick = 1
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 50, 62 },
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 50, 62 },
      },
      working = {
         fps = 2,
         frames = 20,
         columns = 10,
         rows = 2,
         hotspot = { 50, 62 },
      },
   },

   aihints = {
      prohibited_till = 550,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      gauls_baker = 1
   },

   inputs = {
      { name = "water", amount = 6 },
      { name = "flour", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start baking bread because ...
         descname = pgettext("gauls_building", "baking bread"),
         actions = {
            -- time total: 15.4 + 15 + 3.6 = 34 sec
            "return=skipped unless economy needs barbarians_bread",
            "sleep=duration:15s400ms",
            "consume=flour water",
            "animate=working duration:15s",
            "produce=barbarians_bread"
         }
      },
   },
}

pop_textdomain()
