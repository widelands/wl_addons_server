push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/amazons/ferry_yard/"

wl.Descriptions():new_productionsite_type {
   name = "europeans_ferry_yard_level_1",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Ferry Yard Level 1"),
   icon = dirname .. "menu.png",
   
   animation_directory = dirname,
   animations = {
      idle = {hotspot = {43, 44}},
      unoccupied = {hotspot = {43, 44}}
   },
   
   map_check = {"waterways"},
   size = "medium",
   enhancement = {
      name = "europeans_ferry_yard_level_2",
      enhancement_cost = {
         planks = 2,
         granite = 2,
         spidercloth = 2
      },
      enhancement_return_on_dismantle = {
         scrap_wood = 2,
         granite = 2,
         spidercloth = 1
      }
   },

   aihints = {
      needs_water = true,
      prohibited_till = 7200,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1
   },

   working_positions = {
      amazons_shipwright = 1
   },

   inputs = {
      { name = "log", amount = 8 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time of worker: 17.2-38.8 sec
            -- min. time total: 20 + 17.2 = 37.2 sec
            -- max. time total: 20 + 38.8 = 58.8 sec
            "sleep=duration:20s",
            "return=skipped unless fleet needs ferry",
            "consume=log:3",
            "callworker=buildferry"
         }
      },
   },
}

pop_textdomain()
