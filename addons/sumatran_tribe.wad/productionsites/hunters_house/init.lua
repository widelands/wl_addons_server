push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_hunters_house",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("sumatran_building", "Hunter’s House"),
   icon = dirname .. "menu.png",
   size = "small",

   animation_directory = dirname,
   animations = {
      idle = {hotspot = {32, 62}},
   },

   aihints = {
      prohibited_till = 1680,
      forced_after = 3000,
      needs_water = true,
      requires_supporters = true,
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 2,
      normal_ai_limit = 3,
   },

   working_positions = {
      sumatran_hunter_chief = 2,
--      sumatran_hunter = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
         descname = _("hunting"),
         actions = {
            "call=hunt",
            "sleep=duration:15s",
            "call=fish",
            "call=hunt_crocodile",
            "sleep=duration:15s",
--            "return=skipped"
         }
      },
      hunt = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
         descname = _("hunting"),
         actions = {
            "callworker=hunt_chief",
         }
      },
      hunt_crocodile = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting crocodile because ...
         descname = _("hunting crocodile"),
         actions = {
            "callworker=hunt_chief_crocodile",
            "produce=meat",
         }
      },
      fish = {
         -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
         descname = _("fishing"),
         actions = {
            "callworker=fish_chief on failure skip",
            "sleep=duration:15s",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of Game" for missing animals
      title = _("No Game"),
      -- TRANSLATORS: "Game" means animals that you can hunt
      heading = _("Out of Game or Fish"),
      -- TRANSLATORS: "game" means animals that you can hunt
      message = pgettext("sumatran_building", "The hunter working at this hunter’s house can’t find any game in his work area."),
      productivity_threshold = 25
   },
}

pop_textdomain()
