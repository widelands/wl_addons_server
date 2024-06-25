dirname = path.dirname (__file__)

push_textdomain("barbarians_empire_economy_upgrade.wad", true)

wl.Descriptions():new_productionsite_type {
   name = "empire_farm_small",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("empire_building", "Small Farm"),
   icon = dirname .. "menu.png",

   size = "big",
    enhancement = {
        name = "empire_farm",
        enhancement_cost = {
            marble_column = 2
        },
        enhancement_return_on_dismantle = {
            marble_column = 1
        },
    },
   buildcost = {
      granite = 2,
      planks = 2,
      marble = 2
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1,
      marble = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 54, 56 },
      },
   },


    aihints = {
        basic_amount = 3,
        very_weak_ai_limit = 4,
        weak_ai_limit = 6
    },

   working_positions = {
      empire_farmer = 1
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
         -- TRANSLATORS: Completed/Skipped/Did not start planting because ...
         descname = _"planting",
         actions = {
            "callworker=plant",
            "sleep=duration:1m"
         }
      },
      harvest = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting because ...
         descname = _"harvesting",
         actions = {
            "callworker=harvest",
            "sleep=duration:45s",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _"No Fields",
      heading = _"Out of Fields",
      message = pgettext ("empire_building", "The farmer working at this small farm has no cleared soil to plant his seeds."),
      productivity_threshold = 30
   },
}
pop_textdomain()
