push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_winery",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Winery"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      clay = 3,
      granite = 2,
      branch = 2,
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
         hotspot = { 54, 84 },
      },
   },

   aihints = {
      prohibited_till = 560,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
      basic_amount = 1
   },

   working_positions = {
      hebrews_talmid = 1
   },

   inputs = {
      { name = "grape", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start making wine because ...
         descname = _("making wine"),
         actions = {
            -- Grapes are only needed for wine, so no need to check if wine is needed
            "consume=grape:2",
            "sleep=duration:30s",
            "playsound=sound/empire/winebubble priority:40% allow_multiple",
            "sleep=duration:30s",
            "produce=wine"
         }
      },
   },
}

pop_textdomain()
