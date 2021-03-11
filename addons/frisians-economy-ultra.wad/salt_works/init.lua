dirname = path.dirname(__file__)

push_textdomain("frisians-economy-ultra.wad", true)

descriptions:new_productionsite_type {
   name = "frisians_salt_works",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("frisians_building", "Salt Works"),
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

   animation_directory = dirname,
   animations = {
      idle       = { hotspot = { 45, 48 }},
      unoccupied = { hotspot = { 45, 48 }},
   },

   aihints = {
      prohibited_till = 540,
   },

   working_positions = {
      frisians_salter = 1
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
pop_textdomain()
