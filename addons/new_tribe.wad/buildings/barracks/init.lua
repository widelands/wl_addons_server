push_textdomain("new_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "newtribe_barracks",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("newtribe_building", "Barracks"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 4,
      granite = 4,
      reed = 3
   },
   return_on_dismantle = {
      log = 2,
      granite = 2,
      reed = 1
   },

   animation_directory = dirname,
   animations = {idle = {hotspot = {51, 71}}},
   spritesheets = {
      build = {
         hotspot = {51, 71},
         frames = 3,
         columns = 1,
         rows = 3
      }
   },

   aihints = {
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
      prohibited_till = 920
   },

   working_positions = {
      newtribe_trainer = 1
   },

   inputs = {
      { name = "tool", amount = 8 },
      { name = "newtribe_carrier", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
         descname = pgettext("newtribe_building", "recruiting soldier"),
         actions = {
            "return=skipped unless economy needs newtribe_soldier",
            "consume=tool newtribe_carrier",
            "sleep=duration:30s",
            "recruit=newtribe_soldier"
         }
      },
   }
}

pop_textdomain()
