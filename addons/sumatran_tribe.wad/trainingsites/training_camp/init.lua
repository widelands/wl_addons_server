push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_trainingsite_type {
   name = "sumatran_training_camp",
   -- TRANSLATORS: This is a Sumatran building name used in lists of buildings
   descname = pgettext("sumatran_building", "Training Camp"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 1,
      stone = 3,
      tropicalwood = 2,
      palmleaves = 2,
      reed = 2,
      cloth = 2,
      diamond = 3,
      copper = 1,
      gold = 1
   },
   return_on_dismantle = {
      stone = 1,
      tropicalwood = 1,
      cloth = 1,
      diamond = 2,
      gold = 1
   },

   animation_directory = dirname,
   animations = {
      unoccupied = {
         hotspot = { 110, 75 }
      }
   },

   spritesheets = {
      idle = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 110, 75 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 110, 77 }
      },
   },

   aihints = {
      prohibited_till = 1440,
      forced_after = 3300,
      basic_amount = 2,
--      very_weak_ai_limit = 1,
--      weak_ai_limit = 1,
--      normal_ai_limit = 2,
   },

   working_positions = {
      sumatran_chief = 1
   },

   inputs = {
      { name = "meal", amount = 8 },
      { name = "palm_wine", amount = 10 },
      { name = "armor_copper", amount = 3 },
      { name = "armor_golden", amount = 3 },
      { name = "shield_golden", amount = 3 },
      { name = "crocodile_shoes", amount = 3 },
      { name = "warriors_dress", amount = 3 },
   },

   programs = {
      -- Calculation of complete training of one soldier:
      -- each partial training takes additional 6 sec
      -- time total: 7 * 36 = 252 sec
      sleep = {
         -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
         descname = _("sleeping"),
         actions = {
            "sleep=duration:5s",
            "return=skipped",
         }
      },
      upgrade_soldier_evade_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("sumatran_building", "upgrading warrior evade from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:evade level:0", -- Fails when aren't any warrior of level 0 evade
            "return=failed unless site has meal",
            "return=failed unless site has palm_wine",
            "return=failed unless site has crocodile_shoes",
            "checksoldier=soldier:evade level:0", -- Because the warrior can be expelled by the player
            "consume=meal palm_wine crocodile_shoes",
            "train=soldier:evade level:1",
            "sleep=duration:30s"
         }
      },
      upgrade_soldier_health_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("sumatran_building", "upgrading warrior health from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:health level:0",
            "return=failed unless site has meal",
            "return=failed unless site has palm_wine:2",
            "checksoldier=soldier:health level:0",
            "consume=meal palm_wine:2",
            "train=soldier:health level:1",
            "sleep=duration:30s"
         }
      },
      upgrade_soldier_health_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("sumatran_building", "upgrading warrior health from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:health level:1",
            "return=failed unless site has meal",
            "return=failed unless site has palm_wine:2",
            "checksoldier=soldier:health level:1",
            "consume=meal palm_wine:2",
            "train=soldier:health level:2",
            "sleep=duration:30s"
         }
      },
      upgrade_soldier_health_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("sumatran_building", "upgrading warrior health from level 2 to level 3"),
         actions = {
            "checksoldier=soldier:health level:2",
            "return=failed unless site has meal",
            "return=failed unless site has palm_wine",
            "return=failed unless site has warriors_dress",
            "checksoldier=soldier:health level:2",
            "consume=meal palm_wine warriors_dress",
            "train=soldier:health level:3",
            "sleep=duration:30s"
         }
      },
      upgrade_soldier_defense_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("sumatran_building", "upgrading warrior defense from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:defense level:0",
            "return=failed unless site has meal",
            "return=failed unless site has palm_wine",
            "return=failed unless site has armor_copper",
            "checksoldier=soldier:defense level:0",
            "consume=meal palm_wine armor_copper",
            "train=soldier:defense level:1",
            "sleep=duration:30s"
         }
      },
      upgrade_soldier_defense_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("sumatran_building", "upgrading warrior defense from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:defense level:1",
            "return=failed unless site has meal",
            "return=failed unless site has palm_wine",
            "return=failed unless site has armor_golden",
            "checksoldier=soldier:defense level:1",
            "consume=meal palm_wine armor_golden",
            "train=soldier:defense level:2",
            "sleep=duration:30s"
         }
      },
      upgrade_soldier_defense_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("sumatran_building", "upgrading warrior defense from level 2 to level 3"),
         actions = {
            "checksoldier=soldier:defense level:2",
            "return=failed unless site has meal",
            "return=failed unless site has palm_wine",
            "return=failed unless site has shield_golden",
            "checksoldier=soldier:defense level:2",
            "consume=meal palm_wine shield_golden",
            "train=soldier:defense level:3",
            "sleep=duration:30s"
         }
      },
   },

   soldier_capacity = 12,
   trainer_patience = 10,

   messages = {
      -- TRANSLATORS: Sumatran training site tooltip when it has no warrior assigned
      no_soldier = pgettext("sumatran_building", "No warrior to train!"),
      -- TRANSLATORS: Sumatran training site tooltip when none of the present warriors match the current training program
      no_soldier_for_level = pgettext("sumatran_building", "No warrior found for this training level!"),
   },
}

pop_textdomain()
