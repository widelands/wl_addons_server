push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_foresters_house",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Forester’s House"),
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
      unoccupied = {
         hotspot = { 54, 56 },
      },
      idle = {
         hotspot = { 54, 56 },
      },
   },


   aihints = {
--      supports_production_of = { "log" },
      space_consumer = true,
      basic_amount = 5,
      very_weak_ai_limit = 5,
      weak_ai_limit = 6,
      normal_ai_limit = 8,
   },

   working_positions = {
      gauls_forester = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting trees because ...
         descname = _("planting trees"),
         actions = {
            -- time of worker: 16.2-48.6 sec, average 33.5 sec
            -- min. time total: 16.2 + 1 = 17.2 sec
            -- max. time total: 48.6 + 1 = 49.6 sec
            -- avg. time total: 33.5 + 1 = 34.5 sec
            "callworker=plant",
            "sleep=duration:1s"
         }
      },
   },
}

pop_textdomain()
