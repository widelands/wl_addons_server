push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_winery",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Winery"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 1,
      stone = 1,
      tropicalwood = 1,
      palmleaves = 2,
      reed = 1
   },
   return_on_dismantle = {
      stone = 1,
      tropicalwood = 1
   },

   animation_directory = dirname,
   animations = {
      unoccupied = {hotspot = { 60, 59 }},
      idle = {hotspot = { 60, 59 }},
   },

   aihints = {
      prohibited_till = 660,
      requires_supporters = true,
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 4,
      normal_ai_limit = 6,
   },

   working_positions = {
      sumatran_winemaker = 1,
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start making palm wine beer because ...
         descname = _("making palm wine"),
         actions = {
            "callworker=harvest",
            "sleep=duration:29s"
         }
      },
   },
}

pop_textdomain()