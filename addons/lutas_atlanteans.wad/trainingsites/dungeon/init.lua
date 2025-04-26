push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_trainingsite_type {
   name = "lutas_atlanteans_dungeon",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Dungeon"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      planks = 4,
      granite = 4,
      diamond = 2,
      quartz = 2,
      spidercloth = 2,
      gold = 2,
      log = 4
   },
   return_on_dismantle = {
      planks = 2,
      granite = 3,
      diamond = 1,
      quartz = 1,
      gold = 1,
      log = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 55, 59 },
      }
   },

   aihints = {
      trainingsites_max_percent = 50,
      prohibited_till = 2100,
      very_weak_ai_limit = 0,
      weak_ai_limit = 1
   },

   working_positions = {
      lutas_atlanteans_trainer = 1
   },

   inputs = {
      { name = "smoked_fish", amount = 6 },
      { name = "smoked_meat", amount = 6 },
      { name = "atlanteans_bread", amount = 10 },
      { name = "trident_long", amount = 4 },
      { name = "trident_steel", amount = 4 },
      { name = "trident_diamond_double", amount = 4 },
      { name = "trident_heavy_double", amount = 4 }
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
         descname = pgettext("lutas_atlanteans_building", "upgrading soldier attack from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:attack level:0",
            "return=failed unless site has trident_long",
            "return=failed unless site has atlanteans_bread",
            "return=failed unless site has smoked_fish,smoked_meat",
            "sleep=duration:30s",
            "checksoldier=soldier:attack level:0",
            "consume=atlanteans_bread smoked_fish,smoked_meat trident_long",
            "train=soldier:attack level:1"
         }
      },
      upgrade_soldier_attack_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("lutas_atlanteans_building", "upgrading soldier attack from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:attack level:1",
            "return=failed unless site has trident_steel",
            "return=failed unless site has atlanteans_bread",
            "return=failed unless site has smoked_fish,smoked_meat",
            "sleep=duration:30s",
            "checksoldier=soldier:attack level:1",
            "consume=atlanteans_bread smoked_fish,smoked_meat trident_steel",
            "train=soldier:attack level:2"
         }
      },
      upgrade_soldier_attack_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("lutas_atlanteans_building", "upgrading soldier attack from level 2 to level 3"),
         actions = {
            "checksoldier=soldier:attack level:2",
            "return=failed unless site has trident_diamond_double",
            "return=failed unless site has atlanteans_bread",
            "return=failed unless site has smoked_fish,smoked_meat",
            "sleep=duration:30s",
            "checksoldier=soldier:attack level:2",
            "consume=atlanteans_bread smoked_fish,smoked_meat trident_diamond_double",
            "train=soldier:attack level:3"
         }
      },
      upgrade_soldier_attack_3 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("lutas_atlanteans_building", "upgrading soldier attack from level 3 to level 4"),
         actions = {
            "checksoldier=soldier:attack level:3",
            "return=failed unless site has trident_heavy_double",
            "return=failed unless site has atlanteans_bread",
            "return=failed unless site has smoked_fish,smoked_meat",
            "sleep=duration:30s",
            "checksoldier=soldier:attack level:3",
            "consume=atlanteans_bread smoked_fish,smoked_meat trident_heavy_double",
            "train=soldier:attack level:4"
         }
      },
   },

   soldier_capacity = 8,
   trainer_patience = 32,

   messages = {
      -- TRANSLATORS: Atlantean training site tooltip when it has no soldiers assigned
      no_soldier = pgettext("lutas_atlanteans_building", "No soldier to train!"),
      -- TRANSLATORS: Atlantean training site tooltip when none of the present soldiers match the current training program
      no_soldier_for_level = pgettext("lutas_atlanteans_building", "No soldier found for this training level!"),
   },
}

pop_textdomain()
