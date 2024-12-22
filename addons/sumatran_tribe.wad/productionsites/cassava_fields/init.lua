push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_cassava_fields",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("sumatran_building", "Cassava Fields"),
   icon = dirname .. "menu.png",
   size = "big",

   enhancement = {
      name = "sumatran_cassava_plantation",
      enhancement_cost = {
         stone = 1,
         tropicalwood = 1,
         palmleaves = 1,
      },
      enhancement_return_on_dismantle = {
         stone = 1,
         tropicalwood = 1
      }
   },

   buildcost = {
      log = 1,
      stone = 2,
      tropicalwood = 1,
      palmleaves = 1,
      reed = 2
   },
   return_on_dismantle = {
      stone = 1,
      reed = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {hotspot = {55, 73}},
   },

   aihints = {
      prohibited_till = 240,
      space_consumer = true,
      supports_production_of = { "cassavaleaves" },
      basic_amount = 4,
      very_weak_ai_limit = 4,
      weak_ai_limit = 5,
      normal_ai_limit = 8,
   },

   working_positions = {
      sumatran_farmer = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=plant_cassava",
            "call=harvest_cassava",
            "sleep=duration:13s",
         }
      },
      plant_cassava = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting cassava because ...
         descname = _("planting cassava"),
         actions = {
            "callworker=plant",
            "sleep=duration:21s"
         }
      },
      harvest_cassava = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting cassava because ...
         descname = _("harvesting cassava"),
         actions = {
            "callworker=harvest",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Fields"),
      heading = _("Out of Fields"),
      message = pgettext ("sumatran_building", "The farmer working at this cassava fields has no cleared soil to plant new plants."),
      productivity_threshold = 30
   },
}

pop_textdomain()
