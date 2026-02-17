push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_machane",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Machane"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      clay = 4,
      granite = 2,
      branch = 2,
   },
   return_on_dismantle = {
      clay = 2,
      granite = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 59, 65 },
      },
      working = {
         basename = "idle",
         hotspot = { 59, 65 },
      },
      unoccupied = {
         basename = "idle",
         hotspot = { 59, 65 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 920,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      hebrews_geologist = 1
   },

   inputs = {
      { name = "hebrews_talmid", amount = 4 },
      { name = "slingshot", amount = 4 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
         descname = pgettext("hebrews_building", "recruiting soldier"),
         actions = {
            "return=skipped unless economy needs hebrews_soldier",
            "consume=slingshot hebrews_talmid",
            "sleep=duration:15s",
            "animate=working duration:15s",
            "recruit=hebrews_soldier"
         }
      },
   },
}

pop_textdomain()
