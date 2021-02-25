push_textdomain("new_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "newtribe_ferry_yard",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("newtribe_building", "Ferry Yard"),
   icon = dirname .. "menu.png",
   size = "medium",
   map_check = {"waterways"},

   buildcost = {
      granite = 2,
      log = 3,
      reed = 2,
   },
   return_on_dismantle = {
      log = 2,
      granite = 1
   },

   spritesheets = {
      idle = {
         directory = dirname,
         basename = "idle",
         hotspot = {50, 75},
         frames = 10,
         columns = 5,
         rows = 2,
         fps = 10
      }
   },
   animations = {
      unoccupied = {
         directory = dirname,
         basename = "unoccupied",
         hotspot = {50, 58}
      }
   },

   aihints = {},

   working_positions = {
      newtribe_shipwright = 1
   },

   inputs = {
      { name = "log", amount = 8 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "sleep=duration:20s",
            "callworker=buildferry_1",
            "consume=log:4",
            "callworker=buildferry_2"
         }
      },
   },
}

pop_textdomain()
