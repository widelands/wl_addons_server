----------------------------------------------------------------------------------------------
--                         Empire trainingsites
----------------------------------------------------------------------------------------------

if N then
D:modify_unit("building", "empire_arena", "buildcost", "remove", "granite")
D:modify_unit("building", "empire_arena", "buildcost", "set", "marble_column", 1)
D:modify_unit("building", "empire_arena", "buildcost", "set", "marble", 1)
D:modify_unit("building", "empire_arena", "buildcost", "set", "log", 1)
D:modify_unit("building", "empire_arena", "buildcost", "set", "planks", 1)
D:modify_unit("building", "empire_arena", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "empire_arena", "return_on_dismantle", "remove", "planks")
D:modify_unit("building", "empire_arena", "return_on_dismantle", "set", "marble", 1)
D:modify_unit("trainingsite", "empire_arena", "soldier_capacity", 3)
end -- if N
D:modify_unit("productionsite", "empire_arena", "input", "modify_ware", "fish", 4)
D:modify_unit("productionsite", "empire_arena", "input", "modify_ware", "meat", 2)
D:modify_unit("productionsite", "empire_arena", "input", "modify_ware", "empire_bread", 4)
D:modify_unit("productionsite", "empire_arena", "programs", "set", "upgrade_soldier_evade_0", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("empire_building", "upgrading soldier evade from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:evade level:0",
            "return=failed unless site has fish,meat,empire_bread",
            "sleep=duration:30s",
            "checksoldier=soldier:evade level:0",
            "consume=empire_bread,fish,meat",
            "train=soldier:evade level:1"
         }
      })

if N then
D:modify_unit("building", "empire_arena", "enhancement_cost", "remove", "gold")
D:modify_unit("building", "empire_arena", "enhancement_cost", "set", "planks", 1)
D:modify_unit("building", "empire_arena", "enhancement_cost", "set", "marble_column", 2)
D:modify_unit("building", "empire_arena", "enhancement_cost", "set", "marble", 3)
D:modify_unit("building", "empire_arena", "enhancement_cost", "set", "granite", 1)
D:modify_unit("building", "empire_arena", "enhancement_cost", "set", "cloth", 1)
D:modify_unit("building", "empire_arena", "enhancement_return_on_dismantle", "remove", "gold")
D:modify_unit("building", "empire_arena", "enhancement_return_on_dismantle", "set", "marble", 1)
D:modify_unit("trainingsite", "empire_colosseum", "soldier_capacity", 3)
end -- if N
D:modify_unit("productionsite", "empire_colosseum", "programs", "set", "upgrade_soldier_evade_0", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("empire_building", "upgrading soldier evade from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:evade level:0",
            "return=failed unless site has fish,meat,empire_bread",
            "sleep=duration:30s",
            "checksoldier=soldier:evade level:0",
            "consume=empire_bread,fish,meat",
            "train=soldier:evade level:1"
         }
      })
D:modify_unit("productionsite", "empire_colosseum", "programs", "set", "upgrade_soldier_evade_1", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("empire_building", "upgrading soldier evade from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:evade level:1",
            "return=failed unless site has empire_bread:3",
            "return=failed unless site has fish,meat",
            "sleep=duration:30s",
            "checksoldier=soldier:evade level:1",
            "consume=empire_bread:3 fish,meat",
            "train=soldier:evade level:2"
         }
      })


if N then
D:modify_unit("building", "empire_trainingcamp", "buildcost", "remove", "gold")
D:modify_unit("building", "empire_trainingcamp", "buildcost", "remove", "planks")
D:modify_unit("building", "empire_trainingcamp", "buildcost", "set", "marble_column", 1)
D:modify_unit("building", "empire_trainingcamp", "buildcost", "set", "marble", 1)
D:modify_unit("building", "empire_trainingcamp", "buildcost", "set", "log", 1)
D:modify_unit("building", "empire_trainingcamp", "buildcost", "set", "granite", 1)
D:modify_unit("building", "empire_trainingcamp", "buildcost", "set", "cloth", 1)
D:modify_unit("building", "empire_trainingcamp", "return_on_dismantle", "remove", "gold")
D:modify_unit("building", "empire_trainingcamp", "return_on_dismantle", "remove", "planks")
D:modify_unit("building", "empire_trainingcamp", "return_on_dismantle", "set", "marble", 1)
D:modify_unit("building", "empire_trainingcamp", "return_on_dismantle", "set", "granite", 1)
D:modify_unit("trainingsite", "empire_trainingcamp", "soldier_capacity", 5)
end -- if N
D:modify_unit("productionsite", "empire_trainingcamp", "input", "modify_ware", "fish", 8)
D:modify_unit("productionsite", "empire_trainingcamp", "input", "modify_ware", "spear", 4)
D:modify_unit("productionsite", "empire_trainingcamp", "input", "modify_ware", "spear_advanced", 3)
D:modify_unit("productionsite", "empire_trainingcamp", "input", "modify_ware", "spear_heavy", 2)
D:modify_unit("productionsite", "empire_trainingcamp", "input", "modify_ware", "spear_war", 1)
D:modify_unit("productionsite", "empire_trainingcamp", "input", "modify_ware", "armor_helmet", 5)
D:modify_unit("productionsite", "empire_trainingcamp", "input", "modify_ware", "armor", 4)
D:modify_unit("productionsite", "empire_trainingcamp", "input", "modify_ware", "armor_chain", 3)
D:modify_unit("productionsite", "empire_trainingcamp", "input", "modify_ware", "armor_gilded", 2)
D:modify_unit("productionsite", "empire_trainingcamp", "programs", "set", "sleep", {
         -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
         descname = _"sleeping",
         actions = {
            "sleep=duration:100ms",
            "return=skipped",
         }
      })
D:modify_unit("productionsite", "empire_trainingcamp", "programs", "set", "upgrade_soldier_attack_0", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("empire_building", "upgrading soldier attack from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:attack level:0",
            "return=failed unless site has spear",
            "return=failed unless site has empire_bread,fish,meat",
            "sleep=duration:10s",
            "checksoldier=soldier:attack level:0",
            "consume=spear empire_bread,fish,meat",
            "train=soldier:attack level:1"
         }
      })
D:modify_unit("productionsite", "empire_trainingcamp", "programs", "set", "upgrade_soldier_attack_1", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("empire_building", "upgrading soldier attack from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:attack level:1",
            "return=failed unless site has spear_advanced",
            "return=failed unless site has empire_bread",
            "sleep=duration:20s",
            "checksoldier=soldier:attack level:1",
            "consume=spear_advanced empire_bread",
            "train=soldier:attack level:2"
         }
      })
D:modify_unit("productionsite", "empire_trainingcamp", "programs", "set", "upgrade_soldier_attack_2", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("empire_building", "upgrading soldier attack from level 2 to level 3"),
         actions = {
            "checksoldier=soldier:attack level:2",
            "return=failed unless site has spear_heavy",
            "return=failed unless site has empire_bread:2",
            "sleep=duration:40s",
            "checksoldier=soldier:attack level:2",
            "consume=spear_heavy empire_bread:2",
            "train=soldier:attack level:3"
         }
      })
D:modify_unit("productionsite", "empire_trainingcamp", "programs", "set", "upgrade_soldier_attack_3", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("empire_building", "upgrading soldier attack from level 3 to level 4"),
         actions = {
            "checksoldier=soldier:attack level:3",
            "return=failed unless site has spear_war",
            "return=failed unless site has empire_bread:5",
            "sleep=duration:80s",
            "checksoldier=soldier:attack level:3",
            "consume=spear_war empire_bread:5",
            "train=soldier:attack level:4"
         }
      })
D:modify_unit("productionsite", "empire_trainingcamp", "programs", "set", "upgrade_soldier_health_0", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("empire_building", "upgrading soldier health from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:health level:0",
            "return=failed unless site has armor_helmet",
            "return=failed unless site has empire_bread,fish,meat",
            "sleep=duration:15s",
            "checksoldier=soldier:health level:0",
            "consume=armor_helmet empire_bread,fish,meat",
            "train=soldier:health level:1"
         }
      })
D:modify_unit("productionsite", "empire_trainingcamp", "programs", "set", "upgrade_soldier_health_1", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("empire_building", "upgrading soldier health from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:health level:1",
            "return=failed unless site has armor",
            "return=failed unless site has empire_bread:2",
            "sleep=duration:30s",
            "checksoldier=soldier:health level:1",
            "consume=armor empire_bread:2",
            "train=soldier:health level:2"
         }
      })
D:modify_unit("productionsite", "empire_trainingcamp", "programs", "set", "upgrade_soldier_health_2", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("empire_building", "upgrading soldier health from level 2 to level 3"),
         actions = {
            "checksoldier=soldier:health level:2",
            "return=failed unless site has armor_chain",
            "return=failed unless site has empire_bread:3",
            "sleep=duration:60s",
            "checksoldier=soldier:health level:2",
            "consume=armor_chain empire_bread:3",
            "train=soldier:health level:3"
         }
      })
D:modify_unit("productionsite", "empire_trainingcamp", "programs", "set", "upgrade_soldier_health_3", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("empire_building", "upgrading soldier health from level 3 to level 4"),
         actions = {
            "checksoldier=soldier:health level:3",
            "return=failed unless site has armor_gilded",
            "return=failed unless site has empire_bread:5",
            "return=failed unless site has fish,meat",
            "sleep=duration:80s",
            "checksoldier=soldier:health level:3",
            "consume=armor_gilded empire_bread:5 fish,meat",
            "train=soldier:health level:4"
         }
      })
