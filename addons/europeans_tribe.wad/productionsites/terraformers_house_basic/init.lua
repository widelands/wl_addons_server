push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_terraformers_house_basic",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Basic Terraformer’s House"),
   icon = dirname .. "menu.png",
   size = "small",

   enhancement = {
        name = "europeans_terraformers_house_normal",
        enhancement_cost = {
          blackwood = 1,
          cloth = 1,
          quartz = 1
        },
        enhancement_return_on_dismantle = {
          quartz = 1
        },
   },

   buildcost = {
      log = 2,
      reed = 2,
      granite = 2
   },
   return_on_dismantle = {
      log = 1,
      granite = 1
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 45, 92 },
      },
      build = {
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 45, 92 },
      },
      unoccupied = {
         pictures = path.list_files(dirname .. "unoccupied_??.png"),
         hotspot = { 45, 92 },
      },
   },

   aihints = {
      prohibited_till = 3600,
      forced_after = 7200
   },

   working_positions = {
      europeans_terraformer_basic = 1
   },

   inputs = {
      { name = "water", amount = 4 },
      { name = "ration", amount = 2 },
      { name = "beer", amount = 2 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start terraforming because ...
         descname = _"terraforming",
         actions = {
            "consume=ration beer",
            "sleep=duration:15s",
            "callworker=check_terraform_land",
            "consume=water:2",
            "callworker=terraform_land",
            "consume=ration beer",
            "sleep=duration:15s",
            "callworker=check_terraform_coast",
            "callworker=terraform_coast"
         }
      }
   },
}

pop_textdomain()
