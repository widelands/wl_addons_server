push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_palm_planters_hut",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Palm Planter’s Hut"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 4
   },
   return_on_dismantle = {
      log = 2
   },

   animation_directory = dirname,
   animations = {
      idle = {hotspot = { 56, 58 }},
   },


   aihints = {
--      supports_production_of = { "log", "palmleaves", "palm_wine" },
      space_consumer = true,
      basic_amount = 4,
      very_weak_ai_limit = 5,
      weak_ai_limit = 6,
      normal_ai_limit = 7,
   },

   working_positions = {
      sumatran_forester = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting trees because ...
         descname = _("planting trees"),
         actions = {
            -- time of worker: 17.2-42.4 sec, average 29.8 sec
            -- min. time total: 17.2 + 1 = 18.2 sec
            -- max. time total: 42.4 + 1 = 43.4 sec
            -- avg. time total: 29.8 + 1 = 30.8 sec
            "callworker=plant_palm",
            "sleep=duration:1s"
         }
      },
   },
}

pop_textdomain()
