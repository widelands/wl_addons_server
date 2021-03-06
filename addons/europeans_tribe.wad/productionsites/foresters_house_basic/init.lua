push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_foresters_house_basic",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Basic Ranger’s Hut"),
   icon = dirname .. "menu.png",
   size = "small",

   enhancement = {
        name = "europeans_foresters_house_normal",
        enhancement_cost = {
          planks = 1,
          cloth = 1,
          granite = 1,
          quartz = 1
        },
        enhancement_return_on_dismantle = {
          granite = 1,
          quartz = 1
        },
   },

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
         hotspot = { 45, 49 },
      },
      build = {
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 45, 49 },
      },
      unoccupied = {
         pictures = path.list_files(dirname .. "unoccupied_??.png"),
         hotspot = { 45, 49 },
      },
   },

   aihints = {
      space_consumer = true,
      basic_amount = 2,
      forced_after = 1800
   },

   working_positions = {
      europeans_forester_basic = 1
   },
   
   inputs = {
      { name = "water", amount = 4 },
   },
   
   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting trees because ...
         descname = _"planting trees",
         actions = {
            "return=skipped when economy needs water and not economy needs log",
            "consume=water",
            "callworker=plant",
            "sleep=duration:20s"
         }
      },
   },
}

pop_textdomain()
