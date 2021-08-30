push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_brewery_advanced",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Advanced Brewery"),
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
      name = "europeans_brewery_winery",
      enhancement_cost = {
          planks = 2,
          brick = 2,
          grout = 2,
          marble_column = 2,
          diamond = 1
      },
      enhancement_return_on_dismantle = {
          granite = 2,
          marble = 2,
          planks = 1,
          diamond = 1
      }
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 39, 62 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
         hotspot = { 39, 62 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_brewer_advanced = 1
   },

   inputs = {
      { name = "water", amount = 12 },
      { name = "barley", amount = 10 },
      { name = "honey", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=brew_beer",
            "call=brew_mead",
            "call=brew_strong_beer",
            "call=brew_beer_basic",
            "call=brew_mead_basic",
            "call=brew_strong_beer_basic",
            "return=skipped"
         }
      },
      brew_beer_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
         descname = _"brewing beer",
         actions = {
            "return=skipped when economy needs beer",
            "return=skipped when economy needs mead",
            "return=skipped when economy needs beer_strong",
            "return=skipped when economy needs water",
            "consume=water barley",
            "sleep=duration:90s",
            "animate=working duration:60s",
            "produce=beer"
         }
      },
      brew_beer = {
         -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
         descname = _"brewing beer",
         actions = {
            "return=skipped when economy needs water and not economy needs beer",
            "return=skipped unless economy needs beer or workers need experience",
            "return=skipped when site has honey and economy needs mead and not economy needs beer",
            "return=skipped when site has barley and economy needs beer_strong and not economy needs beer",
            "consume=water:3 barley:3",
            "sleep=duration:10s",
            "animate=working duration:60s",
            "produce=beer:3"
         }
      },
      brew_mead_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start brewing mead because ...
         descname = _"brewing mead",
         actions = {
            "return=skipped when economy needs beer",
            "return=skipped when economy needs beer_strong",
            "return=skipped when economy needs mead",
            "return=skipped when economy needs water",
            "consume=water barley honey",
            "sleep=duration:90s",
            "animate=working duration:60s",
            "produce=mead"
         }
      },
      brew_mead = {
         -- TRANSLATORS: Completed/Skipped/Did not start brewing mead because ...
         descname = _"brewing mead",
         actions = {
            "return=skipped when economy needs water and not economy needs mead",
            "return=skipped unless economy needs mead or workers need experience",
            "return=skipped when site has barley and economy needs beer and not economy needs mead",
            "return=skipped when site has barley and economy needs beer_strong and not economy needs mead",
            "consume=water:3 barley:3 honey:3",
            "sleep=duration:10s",
            "animate=working duration:60s",
            "produce=mead:3"
         }
      },
      brew_strong_beer_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start brewing strong beer because ...
         descname = _"brewing strong beer",
         actions = {
            "return=skipped when economy needs beer",
            "return=skipped when economy needs beer_strong",
            "return=skipped when economy needs mead",
            "return=skipped when economy needs water",
            "consume=water barley",
            "sleep=duration:90s",
            "animate=working duration:80s",
            "produce=beer_strong"
         }
      },
      brew_strong_beer = {
         -- TRANSLATORS: Completed/Skipped/Did not start brewing strong beer because ...
         descname = _"brewing strong beer",
         actions = {
            "return=skipped when economy needs water and not economy needs beer_strong",
            "return=skipped unless economy needs beer_strong or workers need experience",
            "return=skipped when site has barley and economy needs beer and not economy needs beer_strong",
            "return=skipped when site has honey and economy needs mead and not economy needs beer_strong",
            "consume=water:4 barley:4",
            "sleep=duration:10s",
            "animate=working duration:80s",
            "produce=beer_strong:3"
         }
      }
   },
}

pop_textdomain()
