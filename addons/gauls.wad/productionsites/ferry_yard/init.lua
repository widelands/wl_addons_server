push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_ferry_yard",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Ferry Yard"),
   icon = dirname .. "menu.png",
   size = "medium",
   map_check = {"waterways"},

   buildcost = {
      granite = 2,
      planks = 2,
      brick = 1,
      reed = 1,
      cloth = 2,
   },
   return_on_dismantle = {
      cloth = 1,
      granite = 1,
      planks = 2,
   },

   -- TODO(Nordfriese): Make animations
   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 56, 72 },
      }
   },

   spritesheets = {
      build= {
         frames = 5,
         columns = 5,
         rows = 1,
         hotspot = { 56, 72 },
      }
   },

   aihints = {
      prohibited_till = 3600,
      needs_water = true,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 2,
   },

   working_positions = {
      gauls_shipwright = 1
   },

   inputs = {
      { name = "log", amount = 6 },
      { name = "reed", amount = 3 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time of worker: 16.2-41.4 sec
            -- min. time total: 20 + 16.2 = 36.2 sec
            -- max. time total: 20 + 41.4 = 61.4 sec
            "sleep=duration:20s",
            "return=skipped unless fleet needs ferry",
            "return=failed unless site has log:2",
            "return=failed unless site has reed",
            "callworker=buildferry_1 on failure fail",
            "consume=log:2 reed",
            "callworker=buildferry_2",
         }
      },
   },
}

pop_textdomain()
