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
         granite = 1,
         tropicalwood = 1,
         palmleaves = 1,
      },
      enhancement_return_on_dismantle = {
         granite = 1,
         tropicalwood = 1
      }
   },

   buildcost = {
      log = 1,
      granite = 2,
      tropicalwood = 1,
      palmleaves = 1,
      reed = 2
   },
   return_on_dismantle = {
      granite = 1,
      reed = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {hotspot = {55, 73}},
   },

   aihints = {
      prohibited_till = 240,
      space_consumer = true,
--      supports_production_of = { "cassavaleaves" },
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
            -- time of worker planting and harvesting : 37.2-51.6 sec, average 43.2 sec
            -- min. time total: 2 * 37.2 + 13 + 21 = 108.4 sec
            -- max. time total: 2 * 51.6 + 13 + 21 = 137.2 sec
            -- avg. time total: 2 * 43.2 + 13 + 21 = 120.4 sec
            -- time of experienced worker planting and harvesting : 17.2-31.6 sec, average 23.2 sec
            -- min. time total: 2 * 17.2 + 13 + 21 = 68.4 sec
            -- max. time total: 2 * 31.6 + 13 + 21 = 97.2 sec
            -- avg. time total: 2 * 23.2 + 13 + 21 = 80.4 sec
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
