push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_trainingsite_type {
   name = "gauls_training_camp",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Training Camp"),
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
         hotspot = { 110, 72 }
      },
   },

   spritesheets = {
      idle = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 110, 72 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 110, 72 }
      },
      working = {
         fps = 1,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 110, 72 }
      },
   },

   aihints = {
      prohibited_till = 2400,
      forced_after = 3300,
      trainingsites_max_percent = 40,
      requires_supporters = true,
      basic_amount = 2,
--      very_weak_ai_limit = 1,
--      weak_ai_limit = 1,
--      normal_ai_limit = 1,
   },

   working_positions = {
      gauls_trainer = 1
   },

   inputs = {
      { name = "sword_short", amount = 4 },
      { name = "sword_long", amount = 4 },
      { name = "meal", amount = 8 },
      { name = "elixir", amount = 8 }
   },

   programs = {
      -- Calculation of complete training of one soldier:
      -- each partial training takes additional 6 sec
      -- time total: 2 * 36 = 72 sec
      sleep = {
         -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
         descname = _("sleeping"),
         actions = {
            "sleep=duration:5s",
            "return=skipped",
         }
      },
      upgrade_soldier_attack_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("gauls_building", "upgrading warrior attack from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:attack level:0", -- Fails when aren't any warriors of level 0 attack
            "return=failed unless site has sword_short",
            "return=failed unless site has meal",
            "return=failed unless site has elixir",
            "checksoldier=soldier:attack level:0", -- Because the warrior can be expelled by the player
            "consume=sword_short meal elixir",
            "train=soldier:attack level:1",
            "sleep=duration:30s"
         }
      },
      upgrade_soldier_attack_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("gauls_building", "upgrading warrior attack from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:attack level:1",
            "return=failed unless site has sword_long",
            "return=failed unless site has meal",
            "return=failed unless site has elixir",
            "checksoldier=soldier:attack level:1", -- Because the warrior can be expelled by the player
            "consume=sword_long meal elixir",
            "train=soldier:attack level:2",
            "sleep=duration:30s"
         }
      },
   },

   soldier_capacity = 8,
   trainer_patience = 20,

   messages = {
      -- TRANSLATORS: Gauls training site tooltip when it has no warriors assigned
      no_soldier = pgettext("gauls_building", "No warrior to train!"),
      -- TRANSLATORS: Gauls training site tooltip when none of the present warriors match the current training program
      no_soldier_for_level = pgettext("gauls_building", "No warrior found for this training level!"),
   },
}

pop_textdomain()
