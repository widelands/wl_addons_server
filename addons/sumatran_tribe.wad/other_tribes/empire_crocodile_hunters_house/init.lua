push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "empire_crocodile_hunters_house",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("empire_building", "Crocodile Hunter’s House"),
   icon = dirname .. "menu.png",
   size = "small",


   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 55, 57 },
      },
   },

   aihints = {
      very_weak_ai_limit = 0,
      weak_ai_limit = 0,
      normal_ai_limit = 0,
   },

   working_positions = {
      empire_hunter = 2
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
         descname = _("hunting"),
         actions = {
            "call=hunt_crocodile",
            "callworker=hunt",
            "sleep=duration:35s",
            "callworker=hunt",
            "sleep=duration:35s"
         }
      },
      hunt_crocodile = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting crocodile because ...
         descname = _("hunting crocodile"),
         actions = {
            "callworker=hunt_crocodile on failure skip",
            "sleep=duration:9s",
         }
      },
   },
   out_of_resource_notification = {
      title = _("No Crocodiles"),
      -- TRANSLATORS: "Game" means animals that you can hunt
      heading = _("Out of Game"),
      -- TRANSLATORS: "game" means animals that you can hunt
      message = pgettext("empire_building", "The hunter working out of this house can’t find any crocodiles in his work area."),
      productivity_threshold = 20
   },
}

pop_textdomain()
