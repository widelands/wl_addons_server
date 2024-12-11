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
      palmleaves = 1,
      reed = 2,
      cloth = 1,
      diamond = 4,
      copper = 1,
      gold = 2
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
      prohibited_till = 2040,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 2,
   },

   working_positions = {
      sumatran_hunter_chief = 1
   },

   inputs = {
      { name = "spear", amount = 8 },
      { name = "meal", amount = 8 },
      { name = "palm_wine", amount = 10 }
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
      upgrade_soldier_attack_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("sumatran_building", "upgrading warrior attack from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:attack level:0", -- Fails when aren't any warriors of level 0 attack
            "return=failed unless site has spear",
            "return=failed unless site has meal",
            "return=failed unless site has palm_wine",
            "callworker=check_chief_crocodile on failure fail",
            "consume=spear meal palm_wine",
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
            "return=failed unless site has spear",
            "return=failed unless site has meal",
            "return=failed unless site has palm_wine:2",
            "callworker=check_chief_crocodile on failure fail",
            "consume=spear meal palm_wine:2",
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
            "return=failed unless site has spear",
            "return=failed unless site has meal",
            "return=failed unless site has palm_wine:2",
            "callworker=check_chief_crocodile on failure fail",
            "consume=spear meal palm_wine:2",
            "callworker=hunt_chief_crocodile",
            "checksoldier=soldier:attack level:2", -- Because the warrior can be expelled by the player
            "train=soldier:attack level:3",
            "produce=meat",
            "sleep=duration:10s"
         }
      },
   },

   soldier_capacity = 8,
   trainer_patience = 12,

   messages = {
      -- TRANSLATORS: Sumatran training site tooltip when it has no warriors assigned
      no_soldier = pgettext("sumatran_building", "No warrior to train!"),
      -- TRANSLATORS: Sumatran training site tooltip when none of the present warriors match the current training program
      no_soldier_for_level = pgettext("sumatran_building", "No warrior found for this training level!"),
   },
}

pop_textdomain()
