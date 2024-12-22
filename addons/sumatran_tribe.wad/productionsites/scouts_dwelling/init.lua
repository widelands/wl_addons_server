push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_scouts_dwelling",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Scout’s Dwelling"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 1,
      stone = 2,
      palmleaves = 1,
      reed = 2
   },
   return_on_dismantle = {
      log = 1,
      stone = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 34, 70 },
      },
   },

   aihints = {
      prohibited_till = 3900,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 1,
   },

   working_positions = {
      sumatran_scout = 1
   },

   inputs = {
      { name = "meal", amount = 2 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start scouting because ...
         descname = _("scouting"),
         actions = {
            -- time of worker: 82.2-214.8 sec
            -- min. time of one scouting: 30 + 82.2 = 112.2 sec
            -- max. time of one scouting: 30 + 214.8 = 244.8 sec
            -- avg. time of one scouting: (112.2 + 244.8) / 2 = 178.5 sec
            "consume=meal",
            "sleep=duration:5s",
            "callworker=scout",
            "sleep=duration:30s",
         }
      },
      targeted_scouting = {
         descname = _("scouting"),
         actions = {
            "consume=meal",
            "callworker=targeted_scouting"
         }
      },
   },
}

pop_textdomain()
