push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_clay_pit_normal",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Normal Clay Pit"),
   icon = dirname .. "menu.png",
   size = "small",
   
   enhancement = {
        name = "europeans_clay_pit_advanced",
        enhancement_cost = {
          planks = 1,
          brick = 1,
          grout = 1,
          marble = 1
        },
        enhancement_return_on_dismantle = {
          granite = 1,
          marble = 1
        },
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 34, 42 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 34, 42 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_claydigger_normal = 1
   },

   inputs = {
      { name = "water", amount = 4 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "callworker=check_dig",
            "call=digging_clay",
            "callworker=check_dike",
            "call=diking_clay",
            "callworker=check_dig",
            "call=making_pond",
            "return=skipped"
         }
      },
      making_pond = {
         -- TRANSLATORS: Completed/Skipped/Did not start making pond because ...
         descname = _"making fish pond",
         actions = {
            "return=skipped unless economy needs fish or workers need experience",
            "return=skipped when economy needs clay",
            "return=failed unless site has water",
            "callworker=dig",
            "consume=water",
            "sleep=duration:10s",
            "animate=working duration:15s",
         },
      },
      digging_clay = {
         -- TRANSLATORS: Completed/Skipped/Did not start digging clay because ...
         descname = _"digging clay",
         actions = {
            "return=skipped unless economy needs clay or workers need experience",
            "return=failed unless site has water",
            "callworker=dig",
            "consume=water",
            "sleep=duration:10s",
            "animate=working duration:15s",
            "sleep=duration:1s",
            "produce=clay"
         },
      },
      diking_clay = {
         -- TRANSLATORS: Completed/Skipped/Did not start diking clay because ...
         descname = _"diking clay",
         actions = {
            "return=skipped unless economy needs clay or workers need experience",
            "callworker=dike",
            "sleep=duration:10s",
            "animate=working duration:15s",
            "sleep=duration:1s",
            "produce=clay"
         },
      },
   },
}

pop_textdomain()
