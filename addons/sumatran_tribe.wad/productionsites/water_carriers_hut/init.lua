push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_water_carriers_hut",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("sumatran_building", "Water Carrier’s Hut"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 3,
      palmleaves = 1
   },
   return_on_dismantle = {
      log = 2,
   },

   animation_directory = dirname,
   animations = {
      unoccupied = {hotspot = { 60, 59 }},
      idle = {hotspot = { 60, 59 }},
   },

   aihints = {
      prohibited_till = 120,
      needs_water = true,
      basic_amount = 3,
      very_weak_ai_limit = 4,
      weak_ai_limit = 5,
      normal_ai_limit = 7,
   },

   working_positions = {
      sumatran_water_carrier = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "sleep=duration:10s",
            "callworker=bring_water",
         }
      },
   },

   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Water"),
      heading = _("Out of Water"),
      message = pgettext ("sumatran_building", "The water carrier working at this hut can’t find any water in its vicinity."),
      productivity_threshold = 33
   },
}

pop_textdomain()
