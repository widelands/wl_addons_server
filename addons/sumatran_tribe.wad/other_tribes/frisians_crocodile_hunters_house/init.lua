push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "frisians_crocodile_hunters_house",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("frisians_building", "Crocodile Hunter’s House"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      brick = 3,
      log = 2,
      reed = 2
   },
   return_on_dismantle = {
      brick = 1,
      log = 1,
      reed = 1
   },

   spritesheets = {
      idle = {
         hotspot = {40, 69},
         frames = 10,
         columns = 5,
         rows = 2,
         fps = 10
      }
   },
   animations = {
      unoccupied = {
         hotspot = {40, 52}
      }
   },

   aihints = {
      very_weak_ai_limit = 0,
      weak_ai_limit = 0,
      normal_ai_limit = 0,
   },

   working_positions = {
      frisians_hunter = 2
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
         descname = _("hunting"),
         actions = {
            "callworker=hunt_crocodile",
            "sleep=duration:35s",
         }
      },
   },
   out_of_resource_notification = {
      title = _("No Crocodiles"),
      -- TRANSLATORS: "Game" means animals that you can hunt
      heading = _("Out of Game"),
      -- TRANSLATORS: "game" means animals that you can hunt
      message = pgettext("frisians_building", "The hunter working out of this house can’t find any crocodiles in his work area."),
      productivity_threshold = 5
   },
}

pop_textdomain()
