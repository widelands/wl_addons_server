dirname = path.dirname (__file__)

push_textdomain("frisians-economy-ultra.wad", true)

descriptions:new_productionsite_type {
   name = "frisians_oat_farm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("frisians_building", "Oat Farm"),
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

   animation_directory = dirname,
   animations = {
      unoccupied = {
         hotspot = { 69, 76 },
      },
   },

   spritesheets = {
      idle = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 69, 76 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 69, 76 }
      },
      working = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 69, 76 }
      },
   },

   aihints = {
      space_consumer = true,
      prohibited_till = 220,
   },

   working_positions = {
      frisians_farmer = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=plant_oat",
            "call=harvest_oat",
         }
      },
      plant_oat = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting oat because ...
         descname = _"planting oat",
         actions = {
            "callworker=plant_oat",
            "sleep=duration:4s"
         }
      },
      harvest_oat = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting oat because ...
         descname = _"harvesting oat",
         actions = {
            "callworker=harvest_oat",
            "sleep=duration:4s",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _"No Fields",
      heading = _"Out of Fields",
      message = pgettext ("frisians_building", "The farmer working at this oat farm has no cleared soil to plant his seeds."),
      productivity_threshold = 30
   },
}
pop_textdomain()
