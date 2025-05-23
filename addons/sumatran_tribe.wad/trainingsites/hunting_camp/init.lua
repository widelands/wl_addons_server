push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_trainingsite_type {
   name = "sumatran_hunting_camp",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Hunting Camp"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 1,
      stone = 3,
      tropicalwood = 2,
      palmleaves = 2,
      reed = 2,
      cloth = 2,
      diamond = 4,
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
      sumatran_hunter_chief = 1
   },

   inputs = {
      { name = "sumatran_spear", amount = 5 },
      { name = "meal", amount = 5 },
      { name = "palm_wine", amount = 10 }
   },

   programs = {
      -- Calculation of complete training of one soldier:
      -- each partial training takes additional 6 sec - see TrainingSite::TrainingSite()
      -- time of worker: 8.7-62.7 sec, average 40.2 sec
      -- min. time total:  8.7 + 6 + 10 = 24.7 sec
      -- max. time total: 62.7 + 6 + 10 = 78.7 sec
      -- avg. time total: 40.2 + 6 + 10 = 56.7 sec, 3 cycles: 170.1 sec
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
         descname = pgettext("sumatran_building", "upgrading warrior attack from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:attack level:0", -- Fails when aren't any warriors of level 0 attack
            "return=failed unless site has sumatran_spear",
            "return=failed unless site has meal",
            "return=failed unless site has palm_wine",
            "callworker=check_chief_crocodile on failure fail",
            "consume=sumatran_spear meal palm_wine",
            "callworker=hunt_chief_crocodile",
            "checksoldier=soldier:attack level:0", -- Because the warrior can be expelled by the player
            "train=soldier:attack level:1",
            "produce=meat",
            "sleep=duration:10s"
         }
      },
      upgrade_soldier_attack_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("sumatran_building", "upgrading warrior attack from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:attack level:1",
            "return=failed unless site has sumatran_spear",
            "return=failed unless site has meal",
            "return=failed unless site has palm_wine:2",
            "callworker=check_chief_crocodile on failure fail",
            "consume=sumatran_spear meal palm_wine:2",
            "callworker=hunt_chief_crocodile",
            "checksoldier=soldier:attack level:1", -- Because the warrior can be expelled by the player
            "train=soldier:attack level:2",
            "produce=meat",
            "sleep=duration:10s"
         }
      },
      upgrade_soldier_attack_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("sumatran_building", "upgrading warrior attack from level 2 to level 3"),
         actions = {
            "checksoldier=soldier:attack level:2",
            "return=failed unless site has sumatran_spear",
            "return=failed unless site has meal",
            "return=failed unless site has palm_wine:2",
            "callworker=check_chief_crocodile on failure fail",
            "consume=sumatran_spear meal palm_wine:2",
            "callworker=hunt_chief_crocodile",
            "checksoldier=soldier:attack level:2", -- Because the warrior can be expelled by the player
            "train=soldier:attack level:3",
            "produce=meat",
            "sleep=duration:10s"
         }
      },
      encyclopedia = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=sumatran_spear meal palm_wine:2",
            "produce=meat crocodile_skin",
         }
      },
   },

   soldier_capacity = 8,
   trainer_patience = 20,

   messages = {
      -- TRANSLATORS: Sumatran training site tooltip when it has no warriors assigned
      no_soldier = pgettext("sumatran_building", "No warrior to train!"),
      -- TRANSLATORS: Sumatran training site tooltip when none of the present warriors match the current training program
      no_soldier_for_level = pgettext("sumatran_building", "No warrior found for this training level!"),
   },
}

pop_textdomain()
