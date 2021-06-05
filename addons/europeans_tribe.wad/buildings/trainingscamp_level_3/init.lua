push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_trainingscamp_level_3",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Trainingscamp Level 3"),
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
        name = "europeans_trainingscamp_level_4",
        enhancement_cost = {
          brick = 2,
          grout = 2,
          marble_column = 2,
          quartz = 1,
          diamond = 1,
          gold = 1
        },
        enhancement_return_on_dismantle = {
          granite = 2,
          marble = 2,
          quartz = 1,
          diamond = 1,
          scrap_metal_mixed = 1
        },
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 47, 47 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 47, 47 },
      }
   },

   aihints = {
      very_weak_ai_limit = 0,
      weak_ai_limit = 0,
     --normal_ai_limit = 2
   },

   working_positions = {
      europeans_trainer_normal = 1
   },

   inputs = {
      { name = "europeans_recruit", amount = 10 },
      { name = "spear_wooden", amount = 10 },
      { name = "armor", amount = 5 },
      { name = "tabard", amount = 5 }
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
            "animate=working duration:45s",
            "recruit=europeans_soldier"
         }
      },
   },
}

pop_textdomain()
