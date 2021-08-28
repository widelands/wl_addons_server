push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_clay_pit_basic",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Basic Clay Pit"),
   icon = dirname .. "menu.png",
   size = "small",
   
   enhancement = {
        name = "europeans_clay_pit_normal",
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
         hotspot = { 44, 43 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 44, 43 },
      },
      build = {
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 44, 43 },
      },
      unoccupied = {
         pictures = path.list_files(dirname .. "unoccupied_??.png"),
         hotspot = { 44, 43 },
      },
   },

   aihints = {
      needs_water = true,
      basic_amount = 2,
      prohibited_till = 3300
   },

   working_positions = {
      europeans_claydigger_basic = 1
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
            "call=making_pond",
            "callworker=check_dig",
            "call=digging_clay",
            "return=skipped"
         }
      },
      making_pond = {
         -- TRANSLATORS: Completed/Skipped/Did not start making pond because ...
         descname = _"making a fish pond",
         actions = {
            "return=skipped unless economy needs fish or workers need experience",
            "return=skipped when economy needs clay or workers need experience",
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
