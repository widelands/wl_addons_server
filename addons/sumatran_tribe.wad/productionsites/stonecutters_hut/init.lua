push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_stonecutters_hut",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Stonecutter's Hut"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 3,
      palmleaves = 1
   },
   return_on_dismantle = {
      log = 1
   },

   animation_directory = dirname,
   animations = {
      unoccupied = {hotspot = { 60, 59 }},
      idle = {hotspot = { 60, 59 }},
   },

   aihints = {
      prohibited_till = 60,
      very_weak_ai_limit = 2,
      weak_ai_limit = 3,
      normal_ai_limit = 4,
   },

   working_positions = {
      sumatran_stonecutter = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start quarrying stone because ...
         descname = _("quarrying stone"),
         actions = {
            -- time of worker: 25.7-50.9 sec, min+max average 38.3 sec
            -- min. time total: 25.7 + 18.5 = 44.2 sec
            -- max. time total: 50.9 + 18.5 = 69.4 sec
            -- avg. time total: 38.3 + 18.5 = 56.8 sec
            "callworker=cut_stone",
            "sleep=duration:18s500ms"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Rocks"),
      heading = _("Out of Rocks"),
      message = pgettext("sumatran_building", "The stonecutter working at this house can’t find any rocks in his work area."),
      productivity_threshold = 75
   },
}

pop_textdomain()
