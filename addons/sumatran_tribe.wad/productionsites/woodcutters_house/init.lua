push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_woodcutters_house",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Woodcutter’s House"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 3,
   },
   return_on_dismantle = {
      log = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {hotspot = { 56, 58 }},
   },

   aihints = {
      requires_supporters = true,
      basic_amount = 7,
      very_weak_ai_limit = 8,
      weak_ai_limit = 10,
      normal_ai_limit = 13
   },

   working_positions = {
      sumatran_woodcutter = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
         descname = _("felling trees"),
         actions = {
            -- min. time total: 23.2 + ( 9 + 10 ) / 3 = 29.5 sec
            -- max. time total: 70.0 + ( 9 + 10 ) / 1 = 89.0 sec
            -- avg. time total: 40.0 + ( 9 + 10 ) / 1 = 59.0 sec
            -- avg. time total: 40.0 + ( 9 + 10 ) / 2 = 49.5 sec
            -- avg. time total: 40.0 + ( 9 + 10 ) / 3 = 46.3 sec
            "call=harvest_palm",
            "call=harvest",
            "call=harvest_tropicalwood",
            "sleep=duration:9s",
            "return=skipped",
         }
      },
      harvest = {
         -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
         descname = _("felling trees"),
         actions = {
            -- time of worker: 17.2-64.0 sec, average 34.0 sec
            -- min. time total: 17.2 + 6 = 23.2 sec
            -- max. time total: 64.0 + 6 = 70.0 sec
            -- avg. time total: 34.0 + 6 = 40.0 sec
            "callworker=harvest on failure skip",
            "sleep=duration:6s"
         }
      },
      harvest_palm = {
         -- TRANSLATORS: Completed/Skipped/Did not start felling palm trees because ...
         descname = _("felling palm trees"),
         actions = {
            "return=skipped when not economy needs log and not economy needs palmleaves",
            "callworker=harvest_palm",
            "sleep=duration:6s"
         }
      },
      harvest_tropicalwood = {
         -- TRANSLATORS: Completed/Skipped/Did not start felling tropical trees because ...
         descname = _("felling tropical trees"),
         actions = {
            "return=skipped unless economy needs tropicalwood",
            "callworker=harvest_tropicalwood",
            "sleep=duration:6s",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Palm Trees or No Trees at All"),
      heading = _("Out of Trees"),
      message = pgettext("sumatran_building", "The woodcutter working at this house can’t find any palm trees in his work area. You should consider dismantling or destroying the building or building a palm planter’s hut or a jungle preserver’s hut nearby."),
      productivity_threshold = 30
   },
}

pop_textdomain()
