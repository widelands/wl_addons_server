push_textdomain("gauls.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_kitchen",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("gauls_building", "Kitchen"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      granite = 2,
      planks = 2,
      brick = 2,
      reed = 2
   },
   return_on_dismantle = {
      granite = 2,
      planks = 1
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
      gauls_cook = 1
   },

   inputs = {
      { name = "barbarians_bread", amount = 8 },
      { name = "milk", amount = 6 },
      { name = "smoked_fish", amount = 6 },
      { name = "smoked_meat", amount = 6 },
      { name = "vegetable", amount = 6 },
      { name = "fruit", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=prepare_meal",
            "call=prepare_ration"
         },
      },
      prepare_meal = {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a meal because ...
         descname = _("preparing a meal"),
         actions = {
            -- time total: 23 sec
            "return=skipped unless economy needs meal",
            "return=failed unless site has barbarians_bread",
            "return=failed unless site has milk,smoked_fish,smoked_meat",
            "return=failed unless site has vegetable,fruit",
            "consume=barbarians_bread milk,smoked_fish,smoked_meat vegetable,fruit",
            "sleep=duration:400ms",
            "animate=working duration:9s",
            "produce=meal",
            "sleep=duration:10s"
         },
      },
      prepare_ration = {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
         descname = _("preparing a ration"),
         actions = {
            -- time total: 23 sec
            "return=skipped unless economy needs ration",
            "return=failed unless site has barbarians_bread",
            "return=failed unless site has milk,smoked_fish,smoked_meat",
            "consume=barbarians_bread milk,smoked_fish,smoked_meat",
            "sleep=duration:400ms",
            "animate=working duration:9s",
            "produce=ration",
            "sleep=duration:10s"
         },
      },
   },
}

pop_textdomain()
