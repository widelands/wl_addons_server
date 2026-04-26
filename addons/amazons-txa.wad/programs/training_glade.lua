push_textdomain("tribes")

local programs = {
      -- Calculation of complete training of one soldier:
      -- each partial training takes additional 6 sec - see TrainingSite::TrainingSite()
      -- according to measurements, additional 5 sec are spent for sleeping + 6 sec for post_timer
      -- time total: 5 + 6 + 4 * 28.8 + 4 * 21.6 = 212.6 sec
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
         descname = pgettext ("amazons_building", "upgrading soldier evade from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:evade level:0",
            "return=failed unless site has boots_sturdy",
            "return=failed unless site has chocolate",
            "return=failed unless site has fish,meat",
            "animate=working duration:22s800ms",
            "checksoldier=soldier:evade level:0", -- Because the soldier can be expelled by the player
            "consume=boots_sturdy chocolate fish,meat",
            "train=soldier:evade level:1"
         }
      },
      upgrade_soldier_evade_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("amazons_building", "upgrading soldier evade from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:evade level:1",
            "return=failed unless site has boots_swift",
            "return=failed unless site has chocolate",
            "return=failed unless site has amazons_bread",
            "return=failed unless site has fish,meat",
            "animate=working duration:15s600ms",
            "checksoldier=soldier:evade level:1", -- Because the soldier can be expelled by the player
            "consume=boots_swift amazons_bread chocolate fish,meat",
            "train=soldier:evade level:2",
         }
      },
      upgrade_soldier_evade_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("amazons_building", "upgrading soldier evade from level 2 to level 3"),
         actions = {
            "checksoldier=soldier:evade level:2",
            "return=failed unless site has boots_hero",
            "return=failed unless site has chocolate:2",
            "return=failed unless site has amazons_bread:2",
            "return=failed unless site has fish,meat:2",
            "animate=working duration:15s600ms",
            "checksoldier=soldier:evade level:2", -- Because the soldier can be expelled by the player
            "consume=boots_hero amazons_bread:2 chocolate:2 fish,meat:2",
            "train=soldier:evade level:3",
         }
      },
      upgrade_soldier_health_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("amazons_building", "upgrading soldier health from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:health level:0",
            "return=failed unless site has armor_wooden",
            "return=failed unless site has chocolate",
            "return=failed unless site has fish,meat",
            "animate=working duration:22s800ms",
            "checksoldier=soldier:health level:0", -- Because the soldier can be expelled by the player
            "consume=armor_wooden chocolate fish,meat",
            "train=soldier:health level:1"
         }
      },
      upgrade_soldier_health_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("amazons_building", "upgrading soldier health from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:health level:1",
            "return=failed unless site has helmet_wooden",
            "return=failed unless site has chocolate",
            "return=failed unless site has amazons_bread",
            "return=failed unless site has fish,meat",
            "animate=working duration:15s600ms",
            "checksoldier=soldier:health level:1", -- Because the soldier can be expelled by the player
            "consume=helmet_wooden amazons_bread chocolate fish,meat",
            "train=soldier:health level:2",
         }
      },
      upgrade_soldier_health_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("amazons_building", "upgrading soldier health from level 2 to level 3"),
         actions = {
            "checksoldier=soldier:health level:2",
            "return=failed unless site has warriors_coat",
            "return=failed unless site has chocolate",
            "return=failed unless site has amazons_bread",
            "return=failed unless site has fish,meat:2",
            "animate=working duration:15s600ms",
            "checksoldier=soldier:health level:2", -- Because the soldier can be expelled by the player
            "consume=warriors_coat amazons_bread chocolate fish,meat:2",
            "train=soldier:health level:3",
         }
      },
      upgrade_soldier_defense_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("amazons_building", "upgrading soldier defense from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:defense level:0",
            "return=failed unless site has vest_padded",
            "return=failed unless site has chocolate",
            "return=failed unless site has amazons_bread",
            "return=failed unless site has fish,meat",
            "animate=working duration:22s800ms",
            "checksoldier=soldier:defense level:0", -- Because the soldier can be expelled by the player
            "consume=vest_padded amazons_bread chocolate fish,meat",
            "train=soldier:defense level:1",
         }
      },
      upgrade_soldier_defense_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("amazons_building", "upgrading soldier defense from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:defense level:1",
            "return=failed unless site has protector_padded",
            "return=failed unless site has chocolate",
            "return=failed unless site has amazons_bread",
            "return=failed unless site has fish,meat:2",
            "animate=working duration:22s800ms",
            "checksoldier=soldier:defense level:1", -- Because the soldier can be expelled by the player
            "consume=protector_padded amazons_bread chocolate fish,meat:2",
            "train=soldier:defense level:2",

         }
      },
}

pop_textdomain()
return programs
