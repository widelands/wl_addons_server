push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_ironmine_basic",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Basic Iron Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   enhancement = {
      name = "europeans_ironmine_level_1",
      enhancement_cost = {
        blackwood = 2,
        planks = 1,
        reed = 1
      },
      enhancement_return_on_dismantle = {
        blackwood = 1
      }
   },

   buildcost = {
      blackwood = 4,
      planks = 2,
      reed = 2
   },
   return_on_dismantle = {
      blackwood = 2
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 21, 36 },
      },
      build = {
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 21, 36 },
      },
      working = {
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 21, 36 },
      },
      empty = {
         pictures = path.list_files(dirname .. "empty_??.png"),
         hotspot = { 21, 36 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_miner_basic = 1
   },

   inputs = {
      { name = "ration", amount = 4 },
      { name = "beer", amount = 4 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining iron because ...
         descname = _"mining iron",
         actions = {
            "return=skipped unless economy needs ore",
            "consume=ration beer",
            "sleep=duration:10s",
            "call=mine_produce",
            "consume=ration beer",
            "sleep=duration:10s",
            "call=mine_produce",
         }
      },
      mine_produce = {
         descname = _"mining iron",
         actions = {
            "animate=working duration:10s",
            "mine=resource_iron radius:4 yield:20% when_empty:2% experience_on_fail:10%",
            "produce=ore",
         }
      },
      encyclopedia = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=ration:2 beer:2",
            "produce=ore:2",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _"No Iron",
      heading = _"Main Iron Vein Exhausted",
      message =
         pgettext("europeans_building", "This iron mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
   },
}

pop_textdomain()
