push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_hunters_tent",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Hunter’s Tent"),
   icon = dirname .. "menu.png",
   size = "small",

    enhancement = {
        name = "sumatran_hunters_house",
        enhancement_cost = {
            log = 1,
            stone = 2,
            palmleaves = 1
        },
        enhancement_return_on_dismantle = {
            stone = 1,
            palmleaves = 1
        },
    },

   buildcost = {
      log = 2,
      palmleaves = 1,
      cloth = 1
   },
   return_on_dismantle = {
      log = 1
   },

   animation_directory = dirname,
   animations = { idle = {
      hotspot = {34, 38},
   }},

   aihints = {
--      prohibited_till = 120,
      forced_after = 60,
--      supports_production_of = { "crocodile_skin", "meat" },
--      requires_supporters = true,
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 3,
      normal_ai_limit = 3,
   },

   working_positions = {
      sumatran_hunter = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
         descname = _("hunting"),
         actions = {
            "call=hunt",
            "sleep=duration:15s",
            "call=fish",
            "call=hunt2",
            "sleep=duration:15s",
            "return=skipped"
         }
      },
      hunt = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
         descname = _("hunting"),
         actions = {
            "callworker=hunt",
         }
      },
      hunt2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
         descname = _("hunting"),
         actions = {
            "callworker=hunt",
         }
      },
      fish = {
         -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
         descname = _("fishing"),
         actions = {
            "callworker=fish on failure skip",
            "sleep=duration:30s"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of Game" for missing animals
      title = _("No Game"),
      -- TRANSLATORS: "Game" means animals that you can hunt
      heading = _("Out of Game or Fish"),
      -- TRANSLATORS: "Game" means animals that you can hunt
      message = pgettext("sumatran_building", "The hunter working at this hunter’s tent can’t find any game in his work area."),
      productivity_threshold = 30
   },
}

pop_textdomain()
