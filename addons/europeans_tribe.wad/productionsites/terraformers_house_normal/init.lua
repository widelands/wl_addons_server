push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_terraformers_house_normal",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Normal Terraformer’s House"),
   icon = dirname .. "menu.png",
   size = "small",

   enhancement = {
      name = "europeans_terraformers_house_advanced",
      enhancement_cost = {
          planks = 1,
          brick = 1,
          grout = 1,
          marble_column = 1,
          diamond = 1
      },
      enhancement_return_on_dismantle = {
          granite = 1,
          marble = 1,
          diamond = 1
      }
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 41, 44 },
      },
      build = {
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 41, 44 },
      }
   },

   aihints = {},

   working_positions = {
      europeans_terraformer_normal = 1
   },

   inputs = {
      { name = "water", amount = 4 },
      { name = "snack", amount = 2 },
      { name = "mead", amount = 2 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start terraforming because ...
         descname = _"terraforming",
         actions = {
            "consume=snack mead",
            "sleep=duration:15s",
            "callworker=check_terraform_land",
            "consume=water:2",
            "callworker=terraform_land",
            "consume=snack mead",
            "sleep=duration:15s",
            "callworker=check_terraform_coast",
            "callworker=terraform_coast"
         }
      }
   },
}

pop_textdomain()
