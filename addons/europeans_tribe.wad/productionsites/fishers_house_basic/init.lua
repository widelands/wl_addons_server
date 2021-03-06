push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_fishers_house_basic",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Basic Fisher’s Hut"),
   icon = dirname .. "menu.png",
   size = "small",

   enhancement = {
        name = "europeans_fishers_house_normal",
        enhancement_cost = {
          planks = 1,
          cloth = 1,
          granite = 1,
          quartz = 1
        },
        enhancement_return_on_dismantle = {
          granite = 1,
          quartz = 1
        },
   },

   buildcost = {
      blackwood = 2,
      reed = 2,
      granite = 1
   },
   return_on_dismantle = {
      blackwood = 1,
      granite = 1
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 39, 52 },
      },
      build = {
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 39, 52 },
      },
      unoccupied = {
         pictures = path.list_files(dirname .. "unoccupied_??.png"),
         hotspot = { 39, 52 },
      },
   },

   aihints = {
      needs_water = true,
      requires_supporters = true,
      basic_amount = 1
   },

   working_positions = {
      europeans_fisher_basic = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
         descname = _"fishing",
         actions = {
            "call=fishing_in_sea"
         }
      },
      fishing_in_sea = {
         -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
         descname = _"fishing in sea",
         actions = {
            "callworker=fish_in_sea",
            "sleep=duration:50s",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _"No Fish",
      heading = _"Out of Fish",
      message = pgettext("europeans_building", "The fisher working out of this fisher’s hut can’t find any fish in his work area. You should consider enhancing it to increase its working area. Remember that you can increase the number of existing fish by building a fish breeder’s house."),
   },
}

pop_textdomain()
