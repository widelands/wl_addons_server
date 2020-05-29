dirname = path.dirname (__file__)

tribes:new_productionsite_type {
   msgctxt = "frisians_building",
   name = "frisians_rye_farm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("frisians_building", "Rye Farm"),
   helptext_script = dirname .. "helptexts.lua",
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

   outputs = {
      "rye"
   },

   indicate_workarea_overlaps = {
      frisians_clay_pit = false,
      frisians_berry_farm = false,
      frisians_reed_farm = false,
      frisians_farm = false,
      frisians_rye_farm = false,
      frisians_foresters_house = false,
      frisians_beekeepers_house = true,
   },

   programs = {
      work = {
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
            "sleep=4000"
         }
      },
      harvest_rye = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting rye because ...
         descname = _"harvesting rye",
         actions = {
            "callworker=harvest_rye",
            "sleep=4000",
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
