push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_palm_planters_hut",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Palm Planter's Hut"),
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
      supports_production_of = { "log" },
      supports_production_of = { "palmleaves" },
      supports_production_of = { "palm_wine" },
      space_consumer = true,
      basic_amount = 4,
      very_weak_ai_limit = 5,
      weak_ai_limit = 8,
      normal_ai_limit = 10,
   },

   working_positions = {
      sumatran_forester = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting trees because ...
         descname = _("planting trees"),
         actions = {
            "callworker=plant_palm",
            "sleep=duration:1s"
         }
      },
   },
}

pop_textdomain()
