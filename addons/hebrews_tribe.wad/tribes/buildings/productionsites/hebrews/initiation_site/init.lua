push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_initiation_site",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("hebrews_building", "Initiation Site"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      clay = 6,
      granite = 3,
      branch = 2,
   },
   return_on_dismantle = {
      clay = 2,
      granite = 2,
   },

   animation_directory = dirname,
   animations = {
      idle = {hotspot = {43, 44}},
      unoccupied = {hotspot = {43, 44}},
   },
   spritesheets = {
      working = {
         hotspot = {43, 44},
         fps = 15,
         frames = 30,
         columns = 6,
         rows = 5
      }
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 920,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      hebrews_carrier = 1 -- TODO: Rabbi
   },

   inputs = {
      { name = "slingshot", amount = 5 },
      { name = "tunic", amount = 5 },
      { name = "bread_hebrews", amount = 5 },
      { name = "fish", amount = 3 },
      { name = "meat", amount = 3 },
      { name = "wine", amount = 3 },
      { name = "hebrews_recruit", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
         descname = pgettext("hebrews_building", "recruiting soldier"),
         actions = {
            "return=skipped unless economy needs hebrews_soldier",
            "consume=slingshot tunic bread_hebrews fish,meat wine hebrews_recruit",
            "sleep=duration:15s",
            "animate=working duration:15s",
            "recruit=hebrews_soldier"
         }
      },
   }
}

pop_textdomain()
