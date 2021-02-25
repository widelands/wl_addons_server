push_textdomain("new_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "newtribe_rye_farm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("newtribe_building", "Rye Farm"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      granite = 2,
      log = 5,
      reed = 1
   },
   return_on_dismantle = {
      granite = 1,
      log = 3,
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 74, 60 },
      },
   },

   aihints = {
      prohibited_till = 550,
      space_consumer = true,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      newtribe_farmer = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=plant",
            "call=harvest",
         }
      },
      plant = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting rye because ...
         descname = _"planting rye",
         actions = {
            "callworker=plant_rye",
            "sleep=duration:10s"
         }
      },
      harvest = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting rye because ...
         descname = _"harvesting rye",
         actions = {
            "callworker=harvest_rye",
            "sleep=duration:3s"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _"No Fields",
      heading = _"Out of Fields",
      message = pgettext("newtribe_building", "The rye farmer working at this rye farm has no cleared soil to plant his seeds."),
      productivity_threshold = 30
   },
}

pop_textdomain()
