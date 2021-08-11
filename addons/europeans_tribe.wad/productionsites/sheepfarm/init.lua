push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_sheepfarm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Sheep Farm"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      blackwood = 2,
      planks = 2,
      reed = 2,
      cloth = 2,
      brick = 2,
      grout = 2,
      marble_column = 2
   },
   return_on_dismantle = {
      blackwood = 1,
      planks = 1,
      granite = 2,
      marble = 2
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 73, 60 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
         hotspot = { 73, 60 },
      },
   },

   aihints = {
      prohibited_till = 3000
   },

   working_positions = {
      europeans_breeder_advanced = 1
   },

   inputs = {
      { name = "water", amount = 6 },
      { name = "blackroot", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_wool_basic",
            "call=produce_wool",
            "return=skipped"
         }
      },
      produce_wool_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing wool because ...
         descname = _"producing wool",
         actions = {
            "return=skipped when economy needs water",
            "consume=water blackroot",
            "sleep=duration:60s",
            "playsound=sound/farm/sheep priority:50% allow_multiple",
            "animate=working duration:60s",
            "produce=wool"
         }
      },
      produce_wool = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing wool because ...
         descname = _"producing wool",
         actions = {
            "return=skipped unless economy needs wool",
            "consume=water:2 blackroot:2",
            "sleep=duration:10s",
            "playsound=sound/farm/sheep priority:50% allow_multiple",
            "animate=working duration:60s",
            "produce=wool:2"
         }
      },
   },
}

pop_textdomain()
