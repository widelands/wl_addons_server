push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_trainingsite_type {
   name = "gauls_fighting_arena",
   -- TRANSLATORS: This is a Gauls building name used in lists of buildings
   descname = pgettext("gauls_building", "Fighting Arena"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      granite = 3,
      planks = 2,
      brick = 4,
      reed = 2,
      cloth = 3,
      copper =1,
      gold =1,
      bronze =1,
   },
   return_on_dismantle = {
      granite = 2,
      planks = 1,
      brick = 2,
      reed = 1,
      cloth = 1,
      gold =1
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
      prohibited_till = 2340,
      forced_after = 4500,
      basic_amount = 1,
--      very_weak_ai_limit = 1,
--      weak_ai_limit = 1,
--      normal_ai_limit = 2,
   },

   working_positions = {
      gauls_trainer = 1
   },

   inputs = {
      { name = "meal", amount = 8 },
      { name = "potion", amount = 8 },
      { name = "armor_chain", amount = 3 },
      { name = "armor_bronze", amount = 3 },
      { name = "shield_wooden", amount = 3 },
      { name = "shield_bronze", amount = 3 },
      { name = "helmet_golden", amount = 3 },
      { name = "tunic", amount = 6 },
   },

   programs = {
      -- Calculation of complete training of one soldier:
      -- each partial training takes additional 6 sec
      -- time total: 5 * 36 = 180 sec
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
         descname = pgettext("gauls_building", "upgrading warrior evade from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:evade level:0", -- Fails when aren't any warrior of level 0 evade
            "return=failed unless site has meal",
            "return=failed unless site has potion",
            "return=failed unless site has shield_wooden",
            "checksoldier=soldier:evade level:0", -- Because the warrior can be expelled by the player
            "consume=meal potion shield_wooden",
            "train=soldier:evade level:1",
            "sleep=duration:30s"
         }
      },
      upgrade_soldier_evade_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("gauls_building", "upgrading warrior evade from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:evade level:1", -- Fails when aren't any warrior of level 1 evade
            "return=failed unless site has meal",
            "return=failed unless site has potion",
            "return=failed unless site has shield_bronze",
            "checksoldier=soldier:evade level:1", -- Because the warrior can be expelled by the player
            "consume=meal potion shield_bronze",
            "train=soldier:evade level:2",
            "sleep=duration:30s"
         }
      },
      upgrade_soldier_defense_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("gauls_building", "upgrading warrior defense from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:defense level:0",
            "return=failed unless site has meal",
            "return=failed unless site has tunic",
            "return=failed unless site has armor_chain",
            "checksoldier=soldier:defense level:0",
            "consume=meal tunic armor_chain",
            "train=soldier:defense level:1",
            "sleep=duration:30s"
         }
      },
      upgrade_soldier_defense_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("gauls_building", "upgrading warrior defense from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:defense level:1",
            "return=failed unless site has meal",
            "return=failed unless site has tunic",
            "return=failed unless site has armor_bronze",
            "checksoldier=soldier:defense level:1",
            "consume=meal tunic armor_bronze",
            "train=soldier:defense level:2",
            "sleep=duration:30s"
         }
      },
      upgrade_soldier_defense_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("gauls_building", "upgrading warrior defense from level 2 to level 3"),
         actions = {
            "checksoldier=soldier:defense level:2",
            "return=failed unless site has meal",
            "return=failed unless site has helmet_golden",
            "checksoldier=soldier:defense level:2",
            "consume=meal helmet_golden",
            "train=soldier:defense level:3",
            "sleep=duration:30s"
         }
      },
   },

   soldier_capacity = 12,
   trainer_patience = 10,

   messages = {
      -- TRANSLATORS: Gauls training site tooltip when it has no warrior assigned
      no_soldier = pgettext("gauls_building", "No warrior to train!"),
      -- TRANSLATORS: Gauls training site tooltip when none of the present warriors match the current training program
      no_soldier_for_level = pgettext("gauls_building", "No warrior found for this training level!"),
   },
}

pop_textdomain()
