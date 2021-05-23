push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_trainingsite_type {
   name = "europeans_battlearena_level_4",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Battle Arena Level 4"),
   icon = dirname .. "menu.png",
   size = "big",

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 81, 106 }
      }
   },

   aihints = {
      trainingsites_max_percent = 10,
      very_weak_ai_limit = 0,
      weak_ai_limit = 1,
     --normal_ai_limit = 4
   },

   working_positions = {
      europeans_trainer = 2
   },

   inputs = {
      { name = "ration", amount = 8 },
      { name = "snack", amount = 8 },
      { name = "meal", amount = 8 },
      { name = "beer", amount = 10 },
      { name = "mead", amount = 10 },
      { name = "beer_strong", amount = 6 },
      { name = "wine", amount = 6 },
      { name = "shield_steel", amount = 2 },
      { name = "shield_advanced", amount = 2 }, 
      
   },

   ["soldier evade"] = {
      food = {
        {"ration", "snack", "meal"},
        {"beer", "mead", "beer_strong", "wine"}
      }
   },
      
   ["soldier defense"] = {
      food = {
        {"ration", "snack", "meal"},
        {"beer", "mead", "beer_strong", "wine"}
      },
      weapons = {"shield_steel", "shield_advanced"}
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
      upgrade_soldier_evade_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier evade from level 1 to level 2"),
         actions = {
            "return=skipped when economy needs beer",
            "checksoldier=soldier:evade level:1", -- Fails when aren't any soldier of level 1 evade
            "sleep=duration:60s",
            "checksoldier=soldier:evade level:1", -- Because the soldier can be expelled by the player
            "consume=ration:2 beer:2",
            "train=soldier:evade level:2"
         }
      },
      upgrade_soldier_evade_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier evade from level 2 to level 3"),
         actions = {
            "return=skipped when economy needs mead",
            "checksoldier=soldier:evade level:2", -- Fails when aren't any soldier of level 0 evade
            "sleep=duration:60s",
            "checksoldier=soldier:evade level:2", -- Because the soldier can be expelled by the player
            "consume=snack mead:2",
            "train=soldier:evade level:3"
         }
      },
      upgrade_soldier_evade_3 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier evade from level 3 to level 4"),
         actions = {
            "return=skipped when economy needs mead",
            "checksoldier=soldier:evade level:3", -- Fails when aren't any soldier of level 1 evade
            "sleep=duration:60s",
            "checksoldier=soldier:evade level:3", -- Because the soldier can be expelled by the player
            "consume=snack:2 mead:2",
            "train=soldier:evade level:4"
         }
      },
      upgrade_soldier_evade_4 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier evade from level 4 to level 5"),
         actions = {
            "return=skipped when economy needs beer_strong",
            "checksoldier=soldier:evade level:4", -- Fails when aren't any soldier of level 1 evade
            "sleep=duration:60s",
            "checksoldier=soldier:evade level:4", -- Because the soldier can be expelled by the player
            "consume=meal:2 beer_strong:2",
            "train=soldier:evade level:5"
         }
      },
      upgrade_soldier_evade_5 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier evade from level 5 to level 6"),
         actions = {
            "return=skipped when economy needs wine",
            "checksoldier=soldier:evade level:5", -- Fails when aren't any soldier of level 1 evade
            "sleep=duration:60s",
            "checksoldier=soldier:evade level:5", -- Because the soldier can be expelled by the player
            "consume=meal:2 wine:2",
            "train=soldier:evade level:6"
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
      upgrade_soldier_defense_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier defense from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:defense level:1", -- Fails when aren't any soldier of level 0 defense
            "sleep=duration:45s",
            "checksoldier=soldier:defense level:1", -- Because the soldier can be expulsed by the player
            "consume=ration beer",
            "train=soldier:defense level:2"
         }
      },
      upgrade_soldier_defense_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier defense from level 2 to level 3"),
         actions = {
            "checksoldier=soldier:defense level:2", -- Fails when aren't any soldier of level 0 defense
            "sleep=duration:45s",
            "checksoldier=soldier:defense level:2", -- Because the soldier can be expulsed by the player
            "consume=snack mead",
            "train=soldier:defense level:3"
         }
      },
      upgrade_soldier_defense_3 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier defense from level 3 to level 4"),
         actions = {
            "return=skipped when economy needs shield_advanced",
            "checksoldier=soldier:defense level:3", -- Fails when aren't any soldier of level 0 defense
            "sleep=duration:45s",
            "checksoldier=soldier:defense level:3", -- Because the soldier can be expulsed by the player
            "consume=snack mead shield_advanced",
            "train=soldier:defense level:4",
            "produce=scrap_metal_mixed"
         }
      },
      upgrade_soldier_defense_4 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier defense from level 4 to level 5"),
         actions = {
            "checksoldier=soldier:defense level:4", -- Fails when aren't any soldier of level 0 defense
            "sleep=duration:45s",
            "checksoldier=soldier:defense level:4", -- Because the soldier can be expulsed by the player
            "consume=meal beer_strong",
            "train=soldier:defense level:5"
         }
      },
      upgrade_soldier_defense_5 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier defense from level 5 to level 6"),
         actions = {
            "checksoldier=soldier:defense level:5", -- Fails when aren't any soldier of level 0 defense
            "sleep=duration:45s",
            "checksoldier=soldier:defense level:5", -- Because the soldier can be expulsed by the player
            "consume=meal wine",
            "train=soldier:defense level:6"
         }
      },
   },
   
   soldier_capacity = 12,
   trainer_patience = 28,
   
   messages = {
      -- TRANSLATORS: Empire training site tooltip when it has no soldiers assigned
      no_soldier = pgettext("europeans_building", "No soldier to train!"),
      -- TRANSLATORS: Empire training site tooltip when none of the present soldiers match the current training program
      no_soldier_for_level = pgettext("europeans_building", "No soldier found for this training level!"),
   },
}

pop_textdomain()
