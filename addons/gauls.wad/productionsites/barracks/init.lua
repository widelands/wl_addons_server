push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_barracks",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Barracks"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      granite = 2,
      planks = 3,
      brick = 4,
      reed = 2,
      cloth = 1,
   },
   return_on_dismantle = {
      granite = 1,
      planks = 2,
      brick = 2
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 57, 88 },
      },
   },

   spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 51, 70 }
      },
      working = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 51, 70 }
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 1520
   },

   working_positions = {
      gauls_trainer = 1
   },

   inputs = {
      { name = "spear", amount = 8 },
      { name = "tunic", amount = 8 },
      { name = "gauls_recruit", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting warrior because ...
         descname = pgettext("gauls_building", "recruiting warrior"),
         actions = {
            -- time total: 30 sec
            "return=skipped unless economy needs gauls_soldier",
            "consume=spear tunic gauls_recruit",
            "animate=working duration:25s",
            "recruit=gauls_soldier",
            "sleep=duration:5s"
         }
      },
   },
}

pop_textdomain()
