push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_quarry",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Quarry"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 2,
      planks = 1
   },
   return_on_dismantle = {
      log = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 40, 49 },
      },
   },

   aihints = {},

   working_positions = {
      lutas_atlanteans_stonecutter = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start quarrying granite because ...
         descname = _("quarrying granite"),
         actions = {
            -- time of worker: 25.7-50.9 sec, min+max average 38.3 sec
            -- min. time total: 25.7 + 18.5 = 44.2 sec
            -- max. time total: 50.9 + 18.5 = 69.4 sec
            -- avg. time total: 38.3 + 18.5 = 56.8 sec
            "callworker=cut_granite",
            "sleep=duration:18s500ms"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Rocks"),
      heading = _("Out of Rocks"),
      message = pgettext("lutas_atlanteans_building", "The stonecutter working at this quarry can’t find any rocks in his work area."),
      productivity_threshold = 75
   },
}

pop_textdomain()
