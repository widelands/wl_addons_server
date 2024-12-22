push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_jungle_preservers_hut",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Jungle Preserver's Hut"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 2,
      palmleaves = 2
   },
   return_on_dismantle = {
      log = 1,
   },

   animations = {
      idle = {
         hotspot = {32, 62},
      }
   },

   aihints = {
      space_consumer = true,
      supports_production_of = { "tropicalwood" },
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 3,
      normal_ai_limit = 3,
   },

   working_positions = {
      sumatran_forester = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting trees because ...
         descname = _("planting trees"),
         actions = {
            "callworker=plant_tropical_tree",
            "sleep=duration:9s"
         }
      },
   },
}

pop_textdomain()
