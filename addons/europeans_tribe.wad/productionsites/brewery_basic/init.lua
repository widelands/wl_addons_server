push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_brewery_basic",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Basic Brewery"),
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
      name = "europeans_brewery_normal",
      enhancement_cost = {
          planks = 2,
          cloth = 2,
          granite = 1,
          quartz = 1
      },
      enhancement_return_on_dismantle = {
          planks = 1,
          granite = 1,
          quartz = 1
      }
   },

   buildcost = {
      blackwood = 3,
      reed = 3,
      granite = 2
   },
   return_on_dismantle = {
      blackwood = 2,
      granite = 1
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 42, 50 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
         hotspot = { 42, 50 },
      },
   },

   aihints = {
       basic_amount = 1
   },

   working_positions = {
      europeans_brewer_basic = 1
   },

   inputs = {
      { name = "water", amount = 6 },
      { name = "barley", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=brew_beer_basic",
            "call=brew_beer",
            "return=skipped"
         }
      },
      brew_beer_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
         descname = _"brewing beer",
         actions = {
            "return=skipped when economy needs beer",
            "return=skipped when economy needs water",
            "consume=water barley",
            "sleep=duration:60s",
            "animate=working duration:80s",
            "produce=beer"
         }
      },
      brew_beer = {
         -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
         descname = _"brewing beer",
         actions = {
            "return=skipped when economy needs water and not economy needs beer",
            "return=skipped unless economy needs beer",
            "consume=water:3 barley:3",
            "sleep=duration:10s",
            "animate=working duration:80s",
            "produce=beer:3"
         }
      },
   },
}

pop_textdomain()
