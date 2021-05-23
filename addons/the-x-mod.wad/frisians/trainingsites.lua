----------------------------------------------------------------------------------------------
--                         Frisian trainingsites
----------------------------------------------------------------------------------------------

if N then
D:modify_unit("building", "frisians_training_camp", "buildcost", "remove", "gold")
D:modify_unit("building", "frisians_training_camp", "buildcost", "set", "brick", 3)
D:modify_unit("building", "frisians_training_camp", "buildcost", "set", "granite", 1)
D:modify_unit("building", "frisians_training_camp", "buildcost", "set", "log", 1)
D:modify_unit("building", "frisians_training_camp", "buildcost", "set", "reed", 2)
D:modify_unit("building", "frisians_training_camp", "return_on_dismantle", "remove", "gold")
D:modify_unit("building", "frisians_training_camp", "return_on_dismantle", "set", "brick", 1)
D:modify_unit("trainingsite", "frisians_training_camp", "soldier_capacity", 5)
end -- if N
D:modify_unit("productionsite", "frisians_training_camp", "input", "modify_ware", "beer", 8)
D:modify_unit("productionsite", "frisians_training_camp", "input", "modify_ware", "bread_frisians", 8)
D:modify_unit("productionsite", "frisians_training_camp", "input", "modify_ware", "smoked_fish", 8)
D:modify_unit("productionsite", "frisians_training_camp", "input", "modify_ware", "sword_long", 4)
D:modify_unit("productionsite", "frisians_training_camp", "input", "modify_ware", "sword_broad", 3)
D:modify_unit("productionsite", "frisians_training_camp", "input", "modify_ware", "sword_double", 2)
D:modify_unit("productionsite", "frisians_training_camp", "programs", "set", "sleep", {
         -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
         descname = _"sleeping",
         actions = {
            "sleep=duration:100ms",
            "return=skipped",
         }
      })
D:modify_unit("productionsite", "frisians_training_camp", "programs", "set", "upgrade_soldier_attack_0", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("frisians_building", "upgrading soldier attack from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:attack level:0", -- Fails when aren't any soldier of level 0 attack
            "return=failed unless site has sword_long",
            "return=failed unless site has bread_frisians,beer,smoked_fish,smoked_meat",
            "sleep=duration:1s",
            "animate=working duration:14s",
            "checksoldier=soldier:attack level:0", -- Because the soldier can be expelled by the player
            "consume=sword_long bread_frisians,beer,smoked_fish,smoked_meat",
            "train=soldier:attack level:1",
            "produce=scrap_iron"
         }
      })
D:modify_unit("productionsite", "frisians_training_camp", "programs", "set", "upgrade_soldier_attack_1", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("frisians_building", "upgrading soldier attack from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:attack level:1",
            "return=failed unless site has sword_broad",
            "return=failed unless site has bread_frisians",
            "sleep=duration:10s",
            "animate=working duration:12s",
            "checksoldier=soldier:attack level:1",
            "consume=sword_broad bread_frisians",
            "train=soldier:attack level:2",
            "produce=scrap_iron:2"
         }
      })
D:modify_unit("productionsite", "frisians_training_camp", "programs", "set", "upgrade_soldier_attack_2", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("frisians_building", "upgrading soldier attack from level 2 to level 3"),
         actions = {
            "checksoldier=soldier:attack level:2",
            "return=failed unless site has sword_double",
            "return=failed unless site has beer,bread_frisians",
            "return=failed unless site has smoked_fish,smoked_meat",
            "sleep=duration:18s",
            "animate=working duration:12s",
            "checksoldier=soldier:attack level:2",
            "consume=sword_double beer,bread_frisians smoked_fish,smoked_meat",
            "train=soldier:attack level:3",
            "produce=scrap_iron scrap_metal_mixed"
         }
      })
D:modify_unit("productionsite", "frisians_training_camp", "programs", "set", "upgrade_soldier_health_0", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("frisians_building", "upgrading soldier health from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:health level:0",
            "return=failed unless site has helmet",
            "return=failed unless site has smoked_fish,bread_frisians",
            "sleep=duration:1s",
            "animate=working duration:15s",
            "checksoldier=soldier:health level:0",
            "consume=helmet smoked_fish,bread_frisians",
            "train=soldier:health level:1"
         }
      })
D:modify_unit("productionsite", "frisians_training_camp", "programs", "set", "upgrade_soldier_defense_0", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("frisians_building", "upgrading soldier defense from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:defense level:0",
            "return=failed unless site has fur_garment_studded",
            "return=failed unless site has bread_frisians,beer:2",
            "return=failed unless site has smoked_fish,smoked_meat",
            "sleep=duration:10s",
            "animate=working duration:14s",
            "checksoldier=soldier:defense level:0",
            "consume=fur_garment_studded bread_frisians,beer:2 smoked_fish,smoked_meat",
            "train=soldier:defense level:1",
            "produce=fur_garment_old"
         }
      })

if N then
D:modify_unit("building", "frisians_training_arena", "buildcost", "remove", "gold")
D:modify_unit("building", "frisians_training_arena", "return_on_dismantle", "remove", "gold")
D:modify_unit("trainingsite", "frisians_training_arena", "soldier_capacity", 5)
D:modify_unit("trainingsite", "frisians_training_arena", "trainer_patience", 5)
end -- if N
D:modify_unit("productionsite", "frisians_training_arena", "input", "modify_ware", "sword_broad", 2)
D:modify_unit("productionsite", "frisians_training_arena", "input", "modify_ware", "sword_double", 2)
D:modify_unit("productionsite", "frisians_training_arena", "programs", "set", "sleep", {
         -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
         descname = _"sleeping",
         actions = {
            "sleep=duration:200ms",
            "return=skipped",
         }
      })
D:modify_unit("productionsite", "frisians_training_arena", "programs", "set", "upgrade_soldier_attack_3", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("frisians_building", "upgrading soldier attack from level 3 to level 4"),
         actions = {
            "checksoldier=soldier:attack level:3",
            "return=failed unless site has sword_long",
            "return=failed unless site has honey_bread,mead",
            "return=failed unless site has smoked_fish,smoked_meat",
            "sleep=duration:30s",
            "animate=working duration:12s",
            "checksoldier=soldier:attack level:3",
            "consume=sword_long honey_bread,mead smoked_fish,smoked_meat",
            "train=soldier:attack level:4"
         }
      })
D:modify_unit("productionsite", "frisians_training_arena", "programs", "set", "upgrade_soldier_attack_4", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("frisians_building", "upgrading soldier attack from level 4 to level 5"),
         actions = {
            "checksoldier=soldier:attack level:4",
            "return=failed unless site has sword_broad",
            "return=failed unless site has honey_bread,mead:2",
            "return=failed unless site has smoked_fish,smoked_meat",
            "sleep=duration:40s",
            "animate=working duration:10s",
            "checksoldier=soldier:attack level:4",
            "consume=sword_broad honey_bread,mead:2 smoked_fish,smoked_meat",
            "train=soldier:attack level:5",
            "produce=scrap_iron:2"
         }
      })
D:modify_unit("productionsite", "frisians_training_arena", "programs", "set", "upgrade_soldier_attack_5", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("frisians_building", "upgrading soldier attack from level 5 to level 6"),
         actions = {
            "checksoldier=soldier:attack level:5",
            "return=failed unless site has sword_double",
            "return=failed unless site has honey_bread:3",
            "return=failed unless site has mead",
            "return=failed unless site has smoked_fish,smoked_meat",
            "sleep=duration:60s",
            "animate=working duration:10s",
            "checksoldier=soldier:attack level:5",
            "consume=sword_double honey_bread:3 mead smoked_fish,smoked_meat",
            "train=soldier:attack level:6",
            "produce=scrap_iron scrap_metal_mixed"
         }
      })
D:modify_unit("productionsite", "frisians_training_arena", "programs", "set", "upgrade_soldier_defense_1", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("frisians_building", "upgrading soldier defense from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:defense level:1",
            "return=failed unless site has fur_garment_golden",
            "return=failed unless site has honey_bread,mead:5",
            "return=failed unless site has smoked_fish,smoked_meat",
            "sleep=duration:80s",
            "animate=working duration:12s",
            "checksoldier=soldier:defense level:1",
            "consume=fur_garment_golden honey_bread,mead:5 smoked_fish,smoked_meat",
            "train=soldier:defense level:2",
            "produce=scrap_iron fur_garment_old"
         }
      })
D:modify_unit("productionsite", "frisians_training_arena", "programs", "set", "upgrade_soldier_health_1", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("frisians_building", "upgrading soldier health from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:health level:1",
            "return=failed unless site has helmet_golden",
            "return=failed unless site has honey_bread,mead:4",
            "return=failed unless site has smoked_fish,smoked_meat",
            "sleep=duration:80s",
            "animate=working duration:12s",
            "checksoldier=soldier:health level:1",
            "consume=helmet_golden honey_bread,mead:4 smoked_fish,smoked_meat",
            "train=soldier:health level:2",
            "produce=scrap_iron"
         }
      })
