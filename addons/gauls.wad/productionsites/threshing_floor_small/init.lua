push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_threshing_floor_small",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Small Threshing Floor"),
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
      name = "gauls_threshing_floor",
      enhancement_cost = {
         granite = 2,
         planks = 1
      },
      enhancement_return_on_dismantle = {
         granite = 1,
         planks = 1
      }
   },
   buildcost = {
      planks = 1,
      granite = 2
   },
   return_on_dismantle = {
      granite = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 58, 50 },
      },
      working = {
         basename = "idle",
         hotspot = { 58, 50 },
      },
   },


   aihints = {
      prohibited_till = 400,
      very_weak_ai_limit = 2,
      weak_ai_limit = 3
   },

   working_positions = {
      gauls_toiler = 1
   },

   inputs = {
      { name = "wheat_sheaf", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- 
            --   6.4 + 3.6 + 5 = 15 sec / 6.4 + 3.6 + 5 + 3.6 + 6.4 = 25 sec
            "return=skipped unless economy needs wheat or economy needs straw",
            "consume=wheat_sheaf",
            "animate=working duration:6s400ms", 
            "produce=wheat",
            "animate=working duration:5s", 
            "return=completed unless economy needs straw",
            "produce=straw",
            "sleep=duration:6s400ms",
         }
      },
   },
}

pop_textdomain()
