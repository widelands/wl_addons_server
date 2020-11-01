dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "frisians_salt_works",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("frisians_building", "Salt Works"),
   helptext_script = dirname .. "helptexts.lua",
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 1,
      brick = 1,
      granite = 1,
      reed = 1
   },
   return_on_dismantle = {
      log = 1,
      brick = 1,
   },

   animation_dirname = dirname,
   animations = {
      idle       = { directory = dirname, hotspot = { 45, 48 }},
      unoccupied = { directory = dirname, hotspot = { 45, 48 }},
   },

   aihints = {
      prohibited_till = 540
   },

   working_positions = {
      frisians_salter = 1
   },

   outputs = {
      "salt"
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "sleep=duration:25s",
            "callworker=make_salt",
         }
      },
   },
}
