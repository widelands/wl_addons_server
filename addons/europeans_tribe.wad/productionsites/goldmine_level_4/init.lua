push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_goldmine_level_4",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Gold Mine Level 4"),
   icon = dirname .. "menu.png",
   size = "mine",

   enhancement = {
      name = "europeans_goldmine_level_5",
      enhancement_cost = {
        blackwood = 2,
        planks = 1,
        reed = 1
      },
      enhancement_return_on_dismantle = {
        blackwood = 1
      }
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 49, 61 },
      },
      working = {
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 49, 61 },
         fps = 10
      },
      empty = {
         pictures = path.list_files(dirname .. "empty_??.png"),
         hotspot = { 49, 61 },
      },
   },
   
   aihints = {},

   working_positions = {
      europeans_miner_normal = 2,
      europeans_miner_advanced = 1
   },

   inputs = {
      { name = "snack", amount = 6 },
      { name = "mead", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining gold because ...
         descname = _"mining gold",
         actions = {
            "return=skipped unless economy needs ore or economy needs quartz",
            "consume=snack mead",
            "sleep=duration:10s",
            "call=mine_produce",
            "call=mine_produce",
            "consume=snack mead",
            "sleep=duration:5s",
            "call=mine_produce",
            "call=mine_produce",
            "call=mine_quartz",
         }
      },
      mine_produce = {
         descname = _"mining gold",
         actions = {
            "animate=working duration:30s",
            "mine=resource_gold radius:8 yield:90% when_empty:15% experience_on_fail:10%",
            "produce=ore",
         }
      },
      mine_quartz = {
         descname = _"mining quartz",
         actions = {
            "animate=working duration:30s",
            "mine=resource_gold radius:8 yield:90% when_empty:15% experience_on_fail:10%",
            "produce=quartz",
         }
      },
      encyclopedia = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=snack:2 mead:2",
            "produce=ore:4 quartz",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _"No Gold",
      heading = _"Main Gold Vein Exhausted",
      message =
         pgettext("europeans_building", "This gold mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
   },
}

pop_textdomain()
