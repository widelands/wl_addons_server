push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_trainingsite_type {
   name = "europeans_battlearena_level_1",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Battle Arena Level 1"),
   icon = dirname .. "menu.png",
   size = "big",

   enhancement = {
        name = "europeans_battlearena_level_2",
        enhancement_cost = {
           cloth = 3,
           brick = 3,
           grout = 3,
           quartz = 1,
           diamond = 1,
           gold = 1
        },
        enhancement_return_on_dismantle = {
           granite = 3,
           quartz = 1,
           diamond = 1,
           scrap_metal_mixed = 1
        },
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 110, 75 },
         fps = 10
      },
      build = {
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 110, 77 },
      },
      unoccupied = {
         pictures = path.list_files(dirname .. "unoccupied_??.png"),
         hotspot = { 110, 75 }
      }
   },

   aihints = {
      trainingsites_max_percent = 10,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
     --normal_ai_limit = 4
   },

   working_positions = {
      europeans_trainer = 1
   },

   inputs = {
      { name = "ration", amount = 6 },
      { name = "beer", amount = 8 },
      { name = "shield_steel", amount = 2 },
      
   },

   ["soldier evade"] = {
      food = {
        {"ration"},
        {"beer"}
      }
   },
      
   ["soldier defense"] = {
      food = {
        {"ration"},
        {"beer"}
      },
      weapons = {"shield_steel"}
   },

   programs = {
      sleep = {
         -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
         descname = _"sleeping",
         actions = {
            "sleep=duration:5s",
            "return=skipped",
         }
      },
      upgrade_soldier_evade_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier evade from level 0 to level 1"),
         actions = {
            "return=skipped when economy needs beer",
            "checksoldier=soldier:evade level:0", -- Fails when aren't any soldier of level 0 evade
            "sleep=duration:60s",
            "checksoldier=soldier:evade level:0", -- Because the soldier can be expelled by the player
            "consume=ration beer:2",
            "train=soldier:evade level:1"
         }
      },
      upgrade_soldier_defense_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier defense from level 0 to level 1"),
         actions = {
            "return=skipped when economy needs shield_steel",
            "checksoldier=soldier:defense level:0", -- Fails when aren't any soldier of level 0 defense
            "sleep=duration:45s",
            "checksoldier=soldier:defense level:0", -- Because the soldier can be expulsed by the player
            "consume=ration beer shield_steel",
            "train=soldier:defense level:1",
            "produce=scrap_iron"
         }
      },
   },

   soldier_capacity = 12,
   trainer_patience = 16,
   
   messages = {
      -- TRANSLATORS: Empire training site tooltip when it has no soldiers assigned
      no_soldier = pgettext("europeans_building", "No soldier to train!"),
      -- TRANSLATORS: Empire training site tooltip when none of the present soldiers match the current training program
      no_soldier_for_level = pgettext("europeans_building", "No soldier found for this training level!"),
   },
}

pop_textdomain()
