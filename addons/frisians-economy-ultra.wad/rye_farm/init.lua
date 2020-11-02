dirname = path.dirname (__file__)

descriptions:new_productionsite_type {
   name = "frisians_rye_farm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("frisians_building", "Rye Farm"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      brick = 3,
      granite = 1,
      log = 2,
      reed = 3
   },
   return_on_dismantle = {
      brick = 2,
      granite = 1,
      log = 1,
      reed = 1
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 74, 60 },
      },
   },

   aihints = {
      space_consumer = true,
      prohibited_till = 220,
      supports_production_of = { "honey" }
   },

   working_positions = {
      frisians_farmer = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=plant_rye",
            "call=harvest_rye",
         }
      },
      plant_rye = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting rye because ...
         descname = _"planting rye",
         actions = {
            "callworker=plant_rye",
            "sleep=duration:4s"
         }
      },
      harvest_rye = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting rye because ...
         descname = _"harvesting rye",
         actions = {
            "callworker=harvest_rye",
            "sleep=duration:4s",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _"No Fields",
      heading = _"Out of Fields",
      message = pgettext ("frisians_building", "The farmer working at this rye farm has no cleared soil to plant his seeds."),
      productivity_threshold = 30
   },
}
