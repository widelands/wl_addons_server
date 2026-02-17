push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_sofers_workshop",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Sofer's Workshop"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 2,
      clay = 4,
      granite = 3,
   },
   return_on_dismantle = {
      granite = 1,
      clay = 2,
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 54, 83 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 1200,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1
   },

   working_positions = {
      hebrews_talmid_chacham = 1
   },

   inputs = {
      { name = "log", amount = 4 },
      { name = "fur", amount = 4 },
      { name = "gold_leaf", amount = 4 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=produce_tefilin",
         }
      },
      produce_tefilin = {
         -- TRANSLATORS: Completed/Skipped/Did not start making tefilin because ...
         descname = _("making tefilin"),
         actions = {
            "return=skipped unless economy needs tefilin",
            "consume=log fur gold_leaf",
            "sleep=duration:25s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "sleep=duration:30s",
            "produce=tefilin"
         }
      },
   },
}

pop_textdomain()
