push_textdomain("gauls.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_kitchen_small",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("gauls_building", "Small Kitchen"),
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
      name = "gauls_kitchen",
      enhancement_cost = {
         granite = 1,
         planks = 1,
         brick = 1
      },
      enhancement_return_on_dismantle = {
         granite = 1
      }
   },

   buildcost = {
      granite = 1,
      planks = 1,
      brick = 1,
      reed = 2
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {hotspot = {52, 73}},
      unoccupied = {hotspot = {52, 73}},
      working = {hotspot = {52, 73}},
   },

   aihints = {
      prohibited_till = 540,
      basic_amount = 1,
      very_weak_ai_limit = 2,
      weak_ai_limit = 2,
      normal_ai_limit = 3,
   },

   working_positions = {
      gauls_cook = 1
   },

   inputs = {
      { name = "barbarians_bread", amount = 8 },
      { name = "milk", amount = 6 },
      { name = "smoked_fish", amount = 6 },
      { name = "smoked_meat", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
         descname = _("preparing a ration"),
         actions = {
            -- time total: 18 sec
            "return=skipped unless economy needs ration",
            "return=failed unless site has barbarians_bread",
            "return=failed unless site has milk,smoked_fish,smoked_meat",
            "consume=barbarians_bread milk,smoked_fish,smoked_meat",
            "sleep=duration:400ms",
            "animate=working duration:9s",
            "produce=ration",
            "sleep=duration:5s"
         },
      },
   },
}

pop_textdomain()
