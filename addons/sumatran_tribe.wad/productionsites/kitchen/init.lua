push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_kitchen",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("sumatran_building", "Kitchen"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 2,
      granite = 2,
      tropicalwood = 2,
      palmleaves = 2,
      reed = 2
   },
   return_on_dismantle = {
      log = 1,
      granite = 1,
      tropicalwood = 1,
      reed = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {hotspot = {52, 73}},
      unoccupied = {hotspot = {52, 73}},
      working = {hotspot = {52, 73}},
      working_waste = {hotspot = {52, 73}},
   },

   aihints = {
      prohibited_till = 540,
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 3,
      normal_ai_limit = 5,
   },

   working_positions = {
      sumatran_cook = 1
   },

   inputs = {
      { name = "starch", amount = 6 },
      { name = "water", amount = 6 },
      { name = "cassavaleaves", amount = 6 },
      { name = "fish", amount = 4 },
      { name = "meat", amount = 4 },
      { name = "eggs", amount = 4 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time total: 36 sec executes only one program, the first one or the second one
            "call=prepare_meal",
            "call=throw_out_overflows",
         },
      },
      prepare_meal = {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a meal because ...
         descname = _("preparing a meal"),
         actions = {
            -- time total: 36 sec
            "return=skipped unless economy needs meal",
            "return=failed unless site has starch:2",
            "return=failed unless site has cassavaleaves,eggs:2",
            "return=failed unless site has fish,meat,eggs:2",
            "return=failed unless site has water",
            "consume=starch:2 cassavaleaves,eggs:2 fish,meat,eggs:2 water",
            "sleep=duration:800ms",
            "animate=working duration:9s",
            "produce=meal",
            "animate=working duration:9s",
            "produce=meal food_waste",
            "sleep=duration:10s",
         },
      },
      throw_out_overflows = {
         -- TRANSLATORS: Completed/Skipped/Did not start throwing out overflows because ...
         descname = _("throwing out overflows"),
         actions = {
            -- time total: 36 sec
            "return=skipped when site has cassavaleaves:2",
            "return=skipped when site has eggs:2",
            "return=skipped when site has cassavaleaves and site has eggs",
            "return=skipped unless economy needs meal",
            "return=failed unless site has starch",
            "consume=starch",
            "sleep=duration:800ms",
            "animate=working_waste duration:9s",
            "produce=food_waste",
            "animate=working_waste duration:9s",
            "produce=food_waste",
            "sleep=duration:10s",
         },
      },
   },
}

pop_textdomain()
