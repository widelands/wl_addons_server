push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_threshing_floor",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Threshing Floor"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      planks = 2,
      granite = 4
   },
   return_on_dismantle = {
      planks = 1,
      granite = 2
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
      very_weak_ai_limit = 0,
      weak_ai_limit = 0,
      normal_ai_limit = 0,
   },

   working_positions = {
      gauls_toiler = 1
   },

   inputs = {
      { name = "wheat_sheaf", amount = 10 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- 
            --   3.4 + 3.6 + 2 = 9 sec / 3.4 + 3.6 + 2 + 3.6 + 2.4 = 15 sec
            "return=skipped unless economy needs wheat or economy needs straw",
            "consume=wheat_sheaf",
            "animate=working duration:3s400ms", 
            "produce=wheat",
            "animate=working duration:2s", 
            "return=completed unless economy needs straw",
            "produce=straw",
            "sleep=duration:2s400ms",
         }
      },
   },
}

pop_textdomain()
