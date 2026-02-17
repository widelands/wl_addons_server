push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_threshing_floor",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Threshing Floor"),
   icon = dirname .. "menu.png",
   size = "mine",

   buildcost = {
      clay = 2,
      granite = 2
   },
   return_on_dismantle = {
      clay = 1,
      granite = 1,
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 53, 67 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 540,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      hebrews_carrier = 3,
   },

   inputs = {
      { name = "wheat", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start threshing wheat because ...
         descname = _("threshing wheat"),
         actions = {
            "return=skipped unless economy needs wheat_grains",
            "consume=wheat",
            "sleep=duration:5s",
            "sleep=duration:20s",
            "produce=wheat_grains"
         }
      },
   },
}

pop_textdomain()
