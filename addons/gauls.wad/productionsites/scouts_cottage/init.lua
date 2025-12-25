push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_scouts_cottage",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Scout’s Cottage"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      granite = 1,
      planks = 1,
      brick = 1,
      reed = 1,
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1
   },

   animation_directory = dirname,
   spritesheets = {
      build = {
         frames = 3,
         columns = 3,
         rows = 1,
         hotspot = { 55, 57 }
      },
      idle = {
         fps = 10,
         frames = 12,
         columns = 6,
         rows = 2,
         hotspot = { 55, 57 }
      },
   },

   aihints = {
      prohibited_till = 3900,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 1,
   },

   working_positions = {
      gauls_scout = 1
   },

   inputs = {
      { name = "ration", amount = 3 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start scouting because ...
         descname = _("scouting"),
         actions = {
            -- time of worker: 82.2-214.8 sec
            -- min. time of one scouting: 10 + 82.2 = 92.2 sec
            -- max. time of one scouting: 10 + 214.8 = 224.8 sec
            "consume=ration",
            "callworker=scout",
            "sleep=duration:10s",
         }
      },
      targeted_scouting = {
         descname = _("scouting"),
         actions = {
            "consume=ration",
            "callworker=targeted_scouting"
         }
      },
   },
}

pop_textdomain()
