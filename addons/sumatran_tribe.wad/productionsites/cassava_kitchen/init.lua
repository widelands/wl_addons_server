push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_cassava_kitchen",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("sumatran_building", "Cassava Kitchen"),
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
      name = "sumatran_kitchen",
      enhancement_cost = {
         log = 1,
         stone = 1,
         tropicalwood = 1,
         palmleaves = 1
      },
      enhancement_return_on_dismantle = {
         log = 1,
         tropicalwood = 1
      }
   },

   buildcost = {
      log = 1,
      stone = 1,
      tropicalwood = 1,
      palmleaves = 1,
      reed = 2
   },
   return_on_dismantle = {
      stone = 1,
      reed = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {hotspot = {52, 73}},
      unoccupied = {hotspot = {52, 73}},
      working = {hotspot = {52, 73}},
   },

   aihints = {
      prohibited_till = 480,
      basic_amount = 3,
      very_weak_ai_limit = 3,
      weak_ai_limit = 4,
      normal_ai_limit = 7,
   },

   working_positions = {
      sumatran_cook = 1
   },

   inputs = {
      { name = "cassavaroot", amount = 8 },
      { name = "water", amount = 6 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start cooking starch because ...
         descname = _("cooking starch"),
         actions = {
            -- time total: 1.2 + 50 + (3 * 3.6) + 13 = 75 sec
            "return=skipped unless economy needs starch",
            "return=failed unless site has cassavaroot:4",
            "return=failed unless site has water:3",
            "consume=cassavaroot:4 water:3",
            "sleep=duration:1s200ms",
            "animate=working duration:50s",
            "produce=starch:3",
            "sleep=duration:13s"
         }
      },
   },
}

pop_textdomain()
