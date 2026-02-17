push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_trainingsite_type {
   name = "hebrews_yeshiva",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Yeshiva"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 2,
      cloth = 4,
      granite = 2,
   },
   return_on_dismantle = {
      log = 1,
      cloth = 1,
      granite = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 70, 80 }
      },
   },

   aihints = {
      trainingsites_max_percent = 10,
      prohibited_till = 900,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      hebrews_donkey = 1
   },

   inputs = {
      { name = "fish", amount = 6 },
      { name = "meat", amount = 6 },
      { name = "bread_hebrews", amount = 10 },
      { name = "tefilin", amount = 4 },
      { name = "wine", amount = 4 },
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
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading soldier evade because ...
         descname = pgettext("hebrews_building", "upgrading soldier evade from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:evade level:0",
            "return=failed unless site has tefilin",
            "return=failed unless site has bread_hebrews",
            "return=failed unless site has fish,meat",
            "sleep=duration:30s",
            "checksoldier=soldier:evade level:0",
            "consume=tefilin bread_hebrews fish,meat",
            "train=soldier:evade level:1"
         }
      },
      upgrade_soldier_evade_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading soldier evade because ...
         descname = pgettext("hebrews_building", "upgrading soldier evade from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:evade level:1",
            "return=failed unless site has tefilin",
            "return=failed unless site has bread_hebrews",
            "return=failed unless site has wine",
            "sleep=duration:30s",
            "checksoldier=soldier:evade level:1",
            "consume=tefilin bread_hebrews wine",
            "train=soldier:evade level:2"
         }
      },
   },

   soldier_capacity = 8,
   trainer_patience = 16,

   messages = {
      -- TRANSLATORS: Hebrew training site tooltip when it has no soldiers assigned
      no_soldier = pgettext("hebrews_building", "No soldier to train!"),
      -- TRANSLATORS: Hebrew training site tooltip when none of the present soldiers match the current training program
      no_soldier_for_level = pgettext("hebrews_building", "No soldier found for this training level!"),
   },
}

pop_textdomain()
