push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_gamekeepers_hut",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Gamekeeper’s Hut"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 2,
      reed = 2,
      granite = 1
   },
   return_on_dismantle = {
      log = 1,
      granite = 1
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 44, 43 },
      },
      build = {
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 44, 43 },
      },
      unoccupied = {
         pictures = path.list_files(dirname .. "unoccupied_??.png"),
         hotspot = { 44, 43 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_gamekeeper = 1
   },
   
   inputs = {
      { name = "water", amount = 4 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "return=skipped when economy needs water and not economy needs meat",
            "consume=water",
            "callworker=release",
            "sleep=duration:52s500ms"
         }
      },
   },
}

pop_textdomain()
