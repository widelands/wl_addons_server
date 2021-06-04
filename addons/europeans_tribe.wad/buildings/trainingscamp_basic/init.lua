push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_trainingscamp_basic",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Basic Trainingscamp"),
   icon = dirname .. "menu.png",
   size = "medium",
   
   enhancement = {
        name = "europeans_trainingscamp_level_1",
        enhancement_cost = {
          planks = 1,
          cloth = 1,
          granite = 1,
          quartz = 1,
          diamond = 1,
          gold = 1
        },
        enhancement_return_on_dismantle = {
          planks = 1,
          granite = 1,
          quartz = 1,
          diamond = 1,
          scrap_metal_mixed = 1
        },
   },
   
   buildcost = {
      blackwood = 2,
      planks = 2,
      reed = 2,
      granite = 2,
      quartz = 1,
      diamond = 1,
      gold = 1
   },
   return_on_dismantle = {
      blackwood = 1,
      planks = 1,
      granite = 1,
      quartz = 1,
      diamond = 1,
      scrap_metal_mixed = 1
   },

   animations = {
      idle = { -- TODO(GunChleoc): make animations
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 50, 38 },
      },
      build = { -- TODO(GunChleoc): make animations
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 50, 38 },
      },
      working = { -- TODO(GunChleoc): make animations
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 50, 38 },
      }
   },

   aihints = {
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
     --normal_ai_limit = 2
   },

   working_positions = {
      europeans_trainer = 1
   },

   inputs = {
      { name = "europeans_recruit", amount = 4 },
      { name = "spear_wooden", amount = 4 },
      { name = "armor", amount = 2 },
      { name = "tabard", amount = 2 }
   },
   
   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=recruit_soldier"
         }
      },
      recruit_soldier = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
         descname = pgettext("europeans_building", "recruiting soldier"),
         actions = {
            "return=skipped unless economy needs europeans_soldier",
            "sleep=duration:30s",
            "consume=armor,tabard spear_wooden europeans_recruit",
            "animate=working duration:90s",
            "recruit=europeans_soldier"
         }
      },
   },
}

pop_textdomain()

