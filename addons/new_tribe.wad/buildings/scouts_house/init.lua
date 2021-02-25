push_textdomain("new_tribe.wad", true)

dirname = path.dirname (__file__)

descriptions:new_productionsite_type {
   name = "newtribe_scouts_house",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("newtribe_building", "Scout’s House"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      granite = 1,
      log = 2,
      reed = 1
   },
   return_on_dismantle = {
      granite = 1,
      log = 1
   },

   spritesheets = {
      idle = {
         directory = dirname,
         basename = "idle",
         hotspot = {40, 66},
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
         hotspot = {40, 60}
      }
   },

   aihints = {},

   working_positions = {
      newtribe_scout = 1
   },

   inputs = {
      { name = "fish", amount = 2 },
      { name = "meat", amount = 2 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start scouting because ...
         descname = _"scouting",
         actions = {
            "consume=fish,meat",
            "sleep=duration:30s",
            "callworker=scout"
         }
      },
      targeted_scouting = {
         descname = _"scouting",
         actions = {
            "consume=fish,meat",
            "callworker=targeted_scouting"
         }
      },
   },
}

pop_textdomain()
