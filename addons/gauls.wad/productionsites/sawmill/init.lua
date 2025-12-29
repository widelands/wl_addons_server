push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_sawmill",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Sawmill"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      brick = 1,
      granite = 3,
      planks = 1,
      reed = 1,
   },
   return_on_dismantle = {
      planks = 1,
      granite = 2
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 48, 62 },
      },
      unoccupied = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 48, 62 },
      },
      working = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 48, 62 },
      },
   },

   aihints = {
      forced_after = 540,
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 2
   },

   working_positions = {
      gauls_woodcutter = 1
   },

   inputs = {
      { name = "log", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start sawing logs because ...
         descname = _("sawing logs"),
         actions = {
            -- time total: 16.4 + 20 + 3.6 = 40 sec
            "return=skipped unless economy needs planks",
            "sleep=duration:16s400ms", 
            "consume=log:2",
            "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
            "animate=working duration:20s", 
            "produce=planks"
         }
      },
   },
}

pop_textdomain()
