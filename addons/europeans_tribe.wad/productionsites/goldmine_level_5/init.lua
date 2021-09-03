push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_goldmine_level_5",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Gold Mine Level 5"),
   icon = dirname .. "menu.png",
   size = "mine",

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 50, 56 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
         hotspot = { 50, 56 },
      },
      empty = {
         pictures = path.list_files(dirname .. "empty_??.png"),
         hotspot = { 50, 56 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_miner_advanced = 3
   },

   inputs = {
      { name = "meal", amount = 8 },
      { name = "wine", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining gold because ...
         descname = _"mining gold",
         actions = {
            "return=skipped unless economy needs ore or economy needs granite or economy needs quartz or workers need experience",
            "consume=meal wine",
            "sleep=duration:5s",
            "call=mine_stone",
            "call=mine_ore",
            "call=mine_ore",
            "consume=meal wine",
            "sleep=duration:5s",
            "call=mine_stone",
            "call=mine_ore",
            "call=mine_ore",
            "call=mine_quartz",
         }
      },
      mine_ore = {
         descname = _"mining gold",
         actions = {
            "animate=working duration:35s",
            "mine=resource_gold radius:12 yield:100% when_empty:20% experience_on_fail:10%",
            "produce=ore",
         }
      },
      mine_stone = {
         descname = _"mining granite",
         actions = {
            "animate=working duration:35s",
            "mine=resource_gold radius:12 yield:100% when_empty:20% experience_on_fail:10%",
            "produce=granite",
         }
      },
      mine_quartz = {
         descname = _"mining quartz",
         actions = {
            "animate=working duration:35s",
            "mine=resource_gold radius:12 yield:100% when_empty:20% experience_on_fail:10%",
            "produce=quartz",
         }
      },
      encyclopedia = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=meal:2 wine:2",
            "produce=ore:4 granite:2 quartz",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _"No Gold",
      heading = _"Main Gold Vein Exhausted",
      message =
         pgettext("europeans_building", "This gold mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider dismantling or destroying it."),
   },
}

pop_textdomain()
