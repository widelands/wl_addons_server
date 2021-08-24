push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_fishers_house_normal",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Normal Fisher’s House"),
   icon = dirname .. "menu.png",
   size = "small",

   enhancement = {
        name = "europeans_fishers_house_advanced",
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
        },
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 34, 42 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_fisher_normal = 1
   },
   
   inputs = {
      { name = "water", amount = 4 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
         descname = _"fishing",
         actions = {
            "call=fishing_in_sea",
            "call=breeding_in_sea",
            "return=skipped"
         }
      },
      breeding_in_sea = {
         -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
         descname = _"breeding in sea",
         actions = {
            "return=skipped when economy needs water",
            "consume=water",
            "sleep=duration:10s",
            "callworker=breed_in_sea",
            "sleep=duration:30s",
         }
      },
      fishing_in_sea = {
         -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
         descname = _"fishing in sea",
         actions = {
            "callworker=fish_in_sea",
            "sleep=duration:40s",
         }
      }
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _"No Fish",
      heading = _"Out of Fish",
      message = pgettext("europeans_building", "The fisher working out of this fisher’s house can’t find any fish in his work area. You should consider enhancing it to increase its working area. Remember that you can increase the number of existing fish by building a fish breeder’s house."),
   },
   -- Translators: Productivity tooltip for Europeans fish breeders when all water fields are already full of fish
   resource_not_needed_message = _"The fishing grounds are full";
}

pop_textdomain()
