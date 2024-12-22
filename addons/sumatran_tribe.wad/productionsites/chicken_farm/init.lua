push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_chicken_farm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Chicken Farm"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 1,
      stone = 2,
      tropicalwood = 2,
      palmleaves = 1,
      reed = 2,
      cloth = 1
   },
   return_on_dismantle = {
      stone = 1,
      tropicalwood = 1,
      cloth = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 83, 75 },
      },
      working = {
         basename = "idle",
         hotspot = { 83, 75 },
      }
   },

   aihints = {
      prohibited_till = 1500, -- 960
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
      normal_ai_limit = 2,
   },

   working_positions = {
      sumatran_breeder = 1
   },

   inputs = {
      { name = "water", amount = 10 },
      { name = "food_waste", amount = 10 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start breeding chickens because ...
         descname = pgettext("sumatran_building", "breeding chickens"),
         actions = {
            -- time total: 40 + 45 + 14 = 99 sec (33 sec/item)
            "call=eggs",
            "call=meat", 
            "sleep=duration:14s",
         }
      },
      eggs = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing eggs because ...
         descname = pgettext("sumatran_building", "producing eggs"),
         actions = {
            -- time total: 25 + 3.6 + 11.4 = 40 sec
            "return=skipped unless economy needs eggs",
            "return=failed unless site has food_waste:3",
            "return=failed unless site has water",
            "consume=food_waste:3 water",
            "animate=working duration:25s", 
            "produce=eggs",
            "sleep=duration:11s400ms",
         }
      },
      meat = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing eggs and meat because ...
         descname = pgettext("sumatran_building", "producing eggs and meat"),
         actions = {
            -- time total: 25 + 3.6 + 1.4 + 3.6 + 11.4 = 45 sec
            "return=skipped unless economy needs eggs",
            "return=failed unless site has food_waste:3",
            "return=failed unless site has water",
            "consume=food_waste:3 water",
            "animate=working duration:25s", 
            "produce=eggs",
            "sleep=duration:1s400ms",
            "produce=meat",
            "sleep=duration:11s400ms",
         }
      },
   },
}

pop_textdomain()
