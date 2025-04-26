push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_trainingsite_type {
   name = "lutas_atlanteans_temple",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Temple"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      planks = 8,
      granite = 5,
      log = 8,
      spidercloth = 4,
      diamond = 2,
      quartz = 2,
      gold = 2,
   },
   return_on_dismantle = {
      planks = 4,
      granite = 3,
      log = 4,
      spidercloth = 2,
      diamond = 1,
      quartz = 1,
      gold = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 86, 91 },
      }
   },

   aihints = {
      trainingsites_max_percent = 35,
      prohibited_till = 1320,
      needs_water = true,
   },

   working_positions = {
      lutas_atlanteans_priestess = 2
   },

   inputs = {
      { name = "smoked_fish", amount = 4 },
      { name = "smoked_meat", amount = 4 },
      { name = "atlanteans_bread", amount = 6 },
      { name = "tabard", amount = 4 },
      { name = "tabard_golden", amount = 4 },
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
      upgrade_soldier_health_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("lutas_atlanteans_building", "upgrading soldier health from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:health level:0", -- Fails when aren't any soldier of level 0 health
            "return=failed unless site has smoked_fish,smoked_meat,atlanteans_bread:2",
            "return=failed unless site has tabard",
            "consume=smoked_fish,smoked_meat,atlanteans_bread:2",
            "callworker=attract_shells",
            "checksoldier=soldier:health level:0", -- Because the soldier can be expelled by the player
            "consume=tabard",
            "train=soldier:health level:1"
         }
      },
      upgrade_soldier_health_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("lutas_atlanteans_building", "upgrading soldier health from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:health level:1",
            "return=failed unless site has smoked_fish,smoked_meat,atlanteans_bread:2",
            "return=failed unless site has tabard_golden",
            "consume=smoked_fish,smoked_meat,atlanteans_bread:2",
            "callworker=attract_shells",
            "checksoldier=soldier:health level:1",
            "consume=tabard_golden",
            "train=soldier:health level:2"
         }
      },
   },

   soldier_capacity = 6,
   trainer_patience = 10,

   messages = {
      -- TRANSLATORS: Atlantean training site tooltip when it has no soldier assigned
      no_soldier = pgettext("lutas_atlanteans_building", "No soldier to train!"),
      -- TRANSLATORS: Atlantean training site tooltip when none of the present soldier match the current training program
      no_soldier_for_level = pgettext("lutas_atlanteans_building", "No soldier found for this training level!"),
   },
}

pop_textdomain()
