push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_terraformers_house_advanced",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Advanced Terraformer’s House"),
   icon = dirname .. "menu.png",
   size = "small",

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 50, 53 },
         fps = 10
      },
      build = {
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 50, 53 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_terraformer_advanced = 1
   },

   inputs = {
      { name = "water", amount = 4 },
      { name = "meal", amount = 2 },
      { name = "wine", amount = 2 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start terraforming because ...
         descname = _"terraforming",
         actions = {
            "consume=meal wine",
            "sleep=duration:15s",
            "callworker=check_terraform_land",
            "consume=water:2",
            "callworker=terraform_land",
            "consume=meal wine",
            "sleep=duration:15s",
            "callworker=check_terraform_coast",
            "callworker=terraform_coast"
         }
      }
   },
}

pop_textdomain()
