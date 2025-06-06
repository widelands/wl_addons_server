push_textdomain("new_soldiers.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_trainingsite_type {
   name = "empire_colosseum",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("empire_building", "Colosseum"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 2,
      granite = 8,
      marble = 8, -- 9
      planks = 6, -- 7
      marble_column = 6,
      cloth = 2,
      gold = 4,
   },
   return_on_dismantle = {
      log = 1,
      granite = 5,
      marble = 4, -- 5
      planks = 3,
      marble_column = 3,
      gold = 2,
   },


   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 91, 114 }
      }
   },

   aihints = {
      trainingsites_max_percent = 40,
      prohibited_till = 900,
      forced_after = 3900,
      basic_amount = 2,
      very_weak_ai_limit = 2,
--      weak_ai_limit = 2,
   },

   working_positions = {
      empire_trainer = 1
   },

   inputs = {
      { name = "fish", amount = 8 },
      { name = "meat", amount = 8 },
      { name = "empire_bread", amount = 8 },
      { name = "shield_wooden", amount = 8 }
   },

   programs = {
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
         descname = pgettext("empire_building", "upgrading soldier evade from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:evade level:0", -- Fails when aren't any soldier of level 0 evade
            "return=failed unless site has empire_bread",
            "return=failed unless site has fish,meat",
            "sleep=duration:30s",
            "checksoldier=soldier:evade level:0", -- Because the soldier can be expelled by the player
            "consume=empire_bread fish,meat",
            "train=soldier:evade level:1"
         }
      },
      upgrade_soldier_defense_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("amazons_building", "upgrading soldier defense from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:defense level:0",
            "return=failed unless site has empire_bread",
            "return=failed unless site has fish,meat",
            "return=failed unless site has shield_wooden",
            "sleep=duration:30s",
            "checksoldier=soldier:defense level:0",
            "consume=empire_bread fish,meat shield_wooden",
            "train=soldier:defense level:1"
         }
      },
   },

   soldier_capacity = 8,
   trainer_patience = 18,

   messages = {
      -- TRANSLATORS: Empire training site tooltip when it has no soldiers assigned
      no_soldier = pgettext("empire_building", "No soldier to train!"),
      -- TRANSLATORS: Empire training site tooltip when none of the present soldiers match the current training program
      no_soldier_for_level = pgettext("empire_building", "No soldier found for this training level!"),
   },
}

pop_textdomain()
