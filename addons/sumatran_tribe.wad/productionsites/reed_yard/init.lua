push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_reed_yard",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Reed Yard"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 3,
      stone = 2,
      palmleaves = 1
   },
   return_on_dismantle = {
      log = 1,
      stone = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 46, 44 },
      },
   },

   aihints = {
      prohibited_till = 300,
      needs_water = true,
      basic_amount = 2,
      very_weak_ai_limit = 3,
      weak_ai_limit = 4,
      normal_ai_limit = 4,
   },

   working_positions = {
      sumatran_reedcutter = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=plant",
            "call=harvest",
         }
      },
      plant = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
         descname = _("planting reed"),
         actions = {
            "callworker=plant",
            "sleep=duration:8s" -- orig sleep=duration:20s but gardener animation was increased by 2sec
         }
      },
      harvest = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
         descname = _("harvesting reed"),
         actions = {
            "callworker=harvest",
            "sleep=duration:3s"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Fields"),
      heading = _("Out of Fields"),
      message = pgettext("sumatran_building", "The gardener working at this reed yard has no cleared soil to plant new plants."),
      productivity_threshold = 20
   },
}

pop_textdomain()
