push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_jungle_marsh",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Jungle Marsh"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      stone = 4,
      tropicalwood = 4,
      reed = 2
   },
   return_on_dismantle = {
      stone = 2,
      tropicalwood = 1
   },

   animation_directory = dirname,
   animations = {
      build = {hotspot = {120, 67}},
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         fps = 14,
         hotspot = { 120, 67 },
      },
   },

   aihints = {
      prohibited_till = 1260,
      forced_after = 1960,
      supports_production_of = { "crocodile_skin" },
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 3,
      normal_ai_limit = 4,
   },

   working_positions = {
      sumatran_jungle_ghost = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "callworker=release",
            "sleep=duration:58s",
            "callworker=release_crocodile",
            "sleep=duration:58s",
            "callworker=release",
            "sleep=duration:58s"
         }
      },
   },
}

pop_textdomain()
