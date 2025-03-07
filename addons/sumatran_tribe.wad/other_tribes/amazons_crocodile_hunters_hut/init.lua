push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "amazons_crocodile_hunters_hut",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("amazons_building", "Crocodile Hunter’s Hut"),
   icon = dirname .. "menu.png",
   size = "small",

   animation_directory = dirname,
   animations = {
      idle = {hotspot = {39, 46}},
      unoccupied = {hotspot = {39, 46}}
   },

   aihints = {
      very_weak_ai_limit = 0,
      weak_ai_limit = 0,
      normal_ai_limit = 0,
   },

   working_positions = {
      amazons_hunter_gatherer = 2
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
         descname = _("hunting"),
         actions = {
            "call=hunt_crocodile",
            "call=hunt",
            "call=fish",

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
      hunt = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
         descname = _("gathering meat"),
         actions = {
            "callworker=hunt",
            "sleep=duration:34s",
         }
      },
      fish = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
         descname = _("gathering fish"),
         actions = {
            "callworker=fish",
            "sleep=duration:34s",
         }
      },
   },
   out_of_resource_notification = {
      title = _("No Crocodiles"),
      -- TRANSLATORS: "Game" means animals that you can hunt
      heading = _("Out of Game"),
      -- TRANSLATORS: "game" means animals that you can hunt
      message = pgettext("amazons_building", "The hunter-gatherer working out of this hut can’t find any crocodiles in her work area."),
      productivity_threshold = 20
   },
}

pop_textdomain()
