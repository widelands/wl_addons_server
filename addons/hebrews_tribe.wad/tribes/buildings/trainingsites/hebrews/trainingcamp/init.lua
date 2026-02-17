push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_trainingsite_type {
   name = "hebrews_trainingcamp",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Training Camp"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 2,
      clay = 8,
      granite = 6,
      branch = 4,
   },
   return_on_dismantle = {
      clay = 3,
      granite = 3,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 112, 109 },
      },
   },

   aihints = {
      prohibited_till = 1500,
      very_weak_ai_limit = 0,
      weak_ai_limit = 1
   },

   working_positions = {
      hebrews_geologist = 1
   },

   inputs = {
      { name = "fish", amount = 6 },
      { name = "meat", amount = 6 },
      { name = "bread_hebrews", amount = 10 },
      { name = "slingshot", amount = 4 },
      { name = "dagger", amount = 4 },
      { name = "tunic", amount = 4 },
      { name = "zizit", amount = 4 },
      { name = "tefilin", amount = 4 },
      { name = "tallit", amount = 4 },
      { name = "menorah", amount = 4 },
      { name = "wine", amount = 6 },
   },

   programs = {
      sleep = {
         descname = _("sleeping"),
         actions = {
            "sleep=duration:5s",
            "return=skipped",
         }
      },
      upgrade_soldier_attack_0 = {
         descname = pgettext("hebrews_building", "upgrading soldier attack from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:attack level:0",
            "return=failed unless site has slingshot",
            "return=failed unless site has bread_hebrews",
            "return=failed unless site has fish,meat",
            "sleep=duration:30s",
            "checksoldier=soldier:attack level:0",
            "consume=slingshot bread_hebrews fish,meat",
            "train=soldier:attack level:1"
         }
      },
      upgrade_soldier_attack_1 = {
         descname = pgettext("hebrews_building", "upgrading soldier attack from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:attack level:1",
            "return=failed unless site has dagger",
            "return=failed unless site has bread_hebrews",
            "return=failed unless site has fish,meat",
            "sleep=duration:30s",
            "checksoldier=soldier:attack level:1",
            "consume=dagger bread_hebrews fish,meat",
            "train=soldier:attack level:2"
         }
      },
      upgrade_soldier_health_0 = {
         descname = pgettext("hebrews_building", "upgrading soldier health from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:health level:0",
            "return=failed unless site has tunic",
            "return=failed unless site has bread_hebrews",
            "sleep=duration:30s",
            "checksoldier=soldier:health level:0",
            "consume=tunic bread_hebrews",
            "train=soldier:health level:1"
         }
      },
      upgrade_soldier_health_1 = {
         descname = pgettext("hebrews_building", "upgrading soldier health from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:health level:1",
            "return=failed unless site has tunic",
            "return=failed unless site has bread_hebrews:2",
            "sleep=duration:30s",
            "checksoldier=soldier:health level:1",
            "consume=tunic bread_hebrews:2",
            "train=soldier:health level:2"
         }
      },
      upgrade_soldier_evade_0 = {
         descname = pgettext("hebrews_building", "upgrading soldier evade from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:evade level:0",
            "return=failed unless site has zizit",
            "return=failed unless site has bread_hebrews",
            "return=failed unless site has fish,meat",
            "sleep=duration:30s",
            "checksoldier=soldier:evade level:0",
            "consume=zizit bread_hebrews fish,meat",
            "train=soldier:evade level:1"
         }
      },
      upgrade_soldier_evade_1 = {
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
      upgrade_soldier_evade_2 = {
         descname = pgettext("hebrews_building", "upgrading soldier evade from level 2 to level 3"),
         actions = {
            "checksoldier=soldier:evade level:2",
            "return=failed unless site has tallit",
            "return=failed unless site has bread_hebrews",
            "return=failed unless site has wine",
            "sleep=duration:30s",
            "checksoldier=soldier:evade level:2",
            "consume=tallit bread_hebrews wine",
            "train=soldier:evade level:3"
         }
      },
      upgrade_soldier_evade_3 = {
         descname = pgettext("hebrews_building", "upgrading soldier evade from level 3 to level 4"),
         actions = {
            "checksoldier=soldier:evade level:3",
            "return=failed unless site has menorah",
            "return=failed unless site has bread_hebrews:2",
            "return=failed unless site has wine",
            "sleep=duration:30s",
            "checksoldier=soldier:evade level:3",
            "consume=menorah bread_hebrews:2 wine",
            "train=soldier:evade level:4"
         }
      },
   },

   soldier_capacity = 12,
   trainer_patience = 24,

   messages = {
      -- TRANSLATORS: Hebrew training site tooltip when it has no soldiers assigned
      no_soldier = pgettext("hebrews_building", "No soldier to train!"),
      -- TRANSLATORS: Hebrew training site tooltip when none of the present soldiers match the current training program
      no_soldier_for_level = pgettext("hebrews_building", "No soldier found for this training level!"),
   },
}

pop_textdomain()
