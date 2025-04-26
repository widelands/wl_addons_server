push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_fishers_house",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Fisher’s House"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 1,
      planks = 2
   },
   return_on_dismantle = {
      planks = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 40, 50 },
      },
   },

   aihints = {
      needs_water = true,
      basic_amount = 2,
      prohibited_till = 540,
      very_weak_ai_limit = 2,
      weak_ai_limit = 4
   },

   working_positions = {
      lutas_atlanteans_fisher = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
         descname = _("fishing"),
         actions = {
            -- time total
            -- min. time total: 2 * 26.2 + 18.2 = 70.6 sec
            -- max. time total: 2 * 55 + 47 = 157 sec
            -- avg. time total: 2 * 40.6 + 32.6 = 113.8 sec
            "call=fish",
            "call=fish",
            "call=collect_seashells"
         }
      },
      fish = {
         -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
         descname = _("fishing"),
         actions = {
            -- time of fishing 
            -- min. time total: 16.7 + 9.5 = 26.2 sec
            -- max. time total: 45.5 + 9.5 = 55 sec
            -- avg. time total: 31.1 + 9.5 = 40.6 sec
            "callworker=fish",
            "sleep=duration:9s500ms"
         }
      },
      collect_seashells = {
         -- TRANSLATORS: Completed/Skipped/Did not start collecting seashells because ...
         descname = _("collecting seashells"),
         actions = {
            -- time of collecting seashells
            -- min. time total: 8.7 + 9.5 = 18.2 sec
            -- max. time total: 37.5 + 9.5 = 47 sec
            -- avg. time total: 23.1 + 9.5 = 32.6 sec
            "callworker=collect_seashells on failure skip",
            "sleep=duration:9s500ms"
         }
      }
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Fish"),
      heading = _("Out of Fish"),
      message = pgettext("lutas_atlanteans_building", "The fisher working out of this fisher’s house can’t find any fish in his work area. Remember that you can increase the number of existing fish by building a fish breeder’s house."),
      productivity_threshold = 25
   },
}

pop_textdomain()
