----------------------------------------------------------------------------------------------
--                         Atlantean trainingsites
----------------------------------------------------------------------------------------------

if N then
D:modify_unit("building", "atlanteans_dungeon", "buildcost", "remove", "gold")
D:modify_unit("building", "atlanteans_dungeon", "buildcost", "remove", "spidercloth")
D:modify_unit("building", "atlanteans_dungeon", "buildcost", "remove", "quartz")
D:modify_unit("building", "atlanteans_dungeon", "buildcost", "remove", "diamond")
D:modify_unit("building", "atlanteans_dungeon", "buildcost", "set", "log", 1)
D:modify_unit("building", "atlanteans_dungeon", "buildcost", "set", "granite", 1)
D:modify_unit("building", "atlanteans_dungeon", "return_on_dismantle", "remove", "gold")
D:modify_unit("building", "atlanteans_dungeon", "return_on_dismantle", "remove", "diamond")
D:modify_unit("building", "atlanteans_dungeon", "return_on_dismantle", "remove", "quartz")
D:modify_unit("building", "atlanteans_dungeon", "return_on_dismantle", "set", "granite", 1)
D:modify_unit("trainingsite", "atlanteans_dungeon", "soldier_capacity", 4)
D:modify_unit("trainingsite", "atlanteans_dungeon", "trainer_patience", 18)
end -- if N

D:modify_unit("productionsite", "atlanteans_dungeon", "input", "modify_ware", "smoked_meat", 4)
D:modify_unit("productionsite", "atlanteans_dungeon", "input", "modify_ware", "atlanteans_bread", 12)
D:modify_unit("productionsite", "atlanteans_dungeon", "input", "modify_ware", "trident_steel", 3)
D:modify_unit("productionsite", "atlanteans_dungeon", "input", "modify_ware", "trident_double", 2)
D:modify_unit("productionsite", "atlanteans_dungeon", "input", "modify_ware", "trident_heavy_double", 1)
D:modify_unit("productionsite", "atlanteans_dungeon", "programs", "set", "sleep", {
         -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
         descname = _"sleeping", actions = {
            "sleep=duration:100ms",
            "return=skipped",
         }})
D:modify_unit("productionsite", "atlanteans_dungeon", "programs", "set", "upgrade_soldier_attack_0", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading soldier attack from level 0 to level 1 because ...
         descname = pgettext("atlanteans_building", "upgrading soldier attack from level 0 to level 1"), actions = {
            "checksoldier=soldier:attack level:0",
            "return=failed unless site has trident_long",
            "return=failed unless site has smoked_fish,smoked_meat,atlanteans_bread",
            "sleep=duration:10s",
            "checksoldier=soldier:attack level:0",
            "consume=atlanteans_bread,smoked_fish,smoked_meat trident_long",
            "train=soldier:attack level:1"
         }})
D:modify_unit("productionsite", "atlanteans_dungeon", "programs", "set", "upgrade_soldier_attack_2", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading soldier attack from level 2 to level 3 because ...
         descname = pgettext("atlanteans_building", "upgrading soldier attack from level 2 to level 3"), actions = {
            "checksoldier=soldier:attack level:2",
            "return=failed unless site has trident_double",
            "return=failed unless site has smoked_fish,smoked_meat,atlanteans_bread:3",
            "sleep=duration:60s",
            "checksoldier=soldier:attack level:2",
            "consume=smoked_fish,smoked_meat,atlanteans_bread:3 trident_double",
            "train=soldier:attack level:3"
         }})
D:modify_unit("productionsite", "atlanteans_dungeon", "programs", "set", "upgrade_soldier_attack_3", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading soldier attack from level 3 to level 4 because ...
         descname = pgettext("atlanteans_building", "upgrading soldier attack from level 3 to level 4"), actions = {
            "checksoldier=soldier:attack level:3",
            "return=failed unless site has trident_heavy_double",
            "return=failed unless site has atlanteans_bread:3",
            "return=failed unless site has smoked_fish,smoked_meat:3",
            "sleep=duration:80s",
            "checksoldier=soldier:attack level:3",
            "consume=atlanteans_bread:3 smoked_fish,smoked_meat:3 trident_heavy_double",
            "train=soldier:attack level:4"
         }})


if N then
D:modify_unit("building", "atlanteans_labyrinth", "buildcost", "remove", "gold")
D:modify_unit("building", "atlanteans_labyrinth", "buildcost", "remove", "diamond")
D:modify_unit("building", "atlanteans_labyrinth", "buildcost", "set", "log", 2)
D:modify_unit("building", "atlanteans_labyrinth", "buildcost", "set", "granite", 1)
D:modify_unit("building", "atlanteans_labyrinth", "buildcost", "set", "planks", 1)
D:modify_unit("building", "atlanteans_labyrinth", "buildcost", "set", "spidercloth", 1)
D:modify_unit("building", "atlanteans_labyrinth", "return_on_dismantle", "remove", "gold")
D:modify_unit("building", "atlanteans_labyrinth", "return_on_dismantle", "remove", "diamond")
D:modify_unit("building", "atlanteans_labyrinth", "return_on_dismantle", "set", "granite", 1)
D:modify_unit("building", "atlanteans_labyrinth", "return_on_dismantle", "set", "spidercloth", 1)
D:modify_unit("trainingsite", "atlanteans_labyrinth", "soldier_capacity", 5)
end -- if N
D:modify_unit("productionsite", "atlanteans_labyrinth", "input", "modify_ware", "smoked_fish", 4)
D:modify_unit("productionsite", "atlanteans_labyrinth", "input", "modify_ware", "smoked_meat", 4)
D:modify_unit("productionsite", "atlanteans_labyrinth", "input", "modify_ware", "atlanteans_bread", 7)
D:modify_unit("productionsite", "atlanteans_labyrinth", "input", "modify_ware", "tabard_golden", 1)
D:modify_unit("productionsite", "atlanteans_labyrinth", "input", "modify_ware", "shield_steel", 3)
D:modify_unit("productionsite", "atlanteans_labyrinth", "input", "modify_ware", "shield_advanced", 2)
D:modify_unit("productionsite", "atlanteans_labyrinth", "programs", "set", "sleep", {
         -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
         descname = _"sleeping", actions = {
            "sleep=duration:100ms",
            "return=skipped",
         }})
D:modify_unit("productionsite", "atlanteans_labyrinth", "programs", "set", "upgrade_soldier_defense_0", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("atlanteans_building", "upgrading soldier defense from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:defense level:0",
            "return=failed unless site has shield_steel",
            "return=failed unless site has atlanteans_bread",
            "return=failed unless site has smoked_fish,smoked_meat",
            "sleep=duration:60s",
            "checksoldier=soldier:defense level:0",
            "consume=atlanteans_bread smoked_fish,smoked_meat shield_steel",
            "train=soldier:defense level:1"
         }
      })
D:modify_unit("productionsite", "atlanteans_labyrinth", "programs", "set", "upgrade_soldier_defense_1", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("atlanteans_building", "upgrading soldier defense from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:defense level:1",
            "return=failed unless site has shield_advanced",
            "return=failed unless site has atlanteans_bread:3",
            "return=failed unless site has smoked_fish,smoked_meat:3",
            "sleep=duration:90s",
            "checksoldier=soldier:defense level:1",
            "consume=atlanteans_bread:3 smoked_fish,smoked_meat:3 shield_advanced",
            "train=soldier:defense level:2"
         }
      })
D:modify_unit("productionsite", "atlanteans_labyrinth", "programs", "set", "upgrade_soldier_health_0", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("atlanteans_building", "upgrading soldier health from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:health level:0",
            "return=failed unless site has tabard_golden",
            "return=failed unless site has smoked_fish,smoked_meat",
            "sleep=duration:30s",
            "checksoldier=soldier:health level:0",
            "consume=smoked_fish,smoked_meat tabard_golden",
            "train=soldier:health level:1"
         }
      })
D:modify_unit("productionsite", "atlanteans_labyrinth", "programs", "set", "upgrade_soldier_evade_0", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("atlanteans_building", "upgrading soldier evade from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:evade level:0",
            "return=failed unless site has atlanteans_bread",
            "return=failed unless site has smoked_fish,smoked_meat",
            "sleep=duration:30s",
            "checksoldier=soldier:evade level:0",
            "consume=atlanteans_bread smoked_fish,smoked_meat",
            "train=soldier:evade level:1"
         }
      })
D:modify_unit("productionsite", "atlanteans_labyrinth", "programs", "set", "upgrade_soldier_evade_1", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("atlanteans_building", "upgrading soldier evade from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:evade level:1",
            "return=failed unless site has atlanteans_bread",
            "return=failed unless site has smoked_fish,smoked_meat",
            "sleep=duration:30s",
            "checksoldier=soldier:evade level:1",
            "consume=atlanteans_bread smoked_fish,smoked_meat",
            "train=soldier:evade level:2"
         }
      })
