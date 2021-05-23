----------------------------------------------------------------------------------------------
--                         Barbarian trainingsites
----------------------------------------------------------------------------------------------

if N then
D:modify_unit("building", "barbarians_battlearena", "buildcost", "remove", "gold")
D:modify_unit("building", "barbarians_battlearena", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_battlearena", "buildcost", "remove", "grout")
D:modify_unit("building", "barbarians_battlearena", "return_on_dismantle", "remove", "gold")
D:modify_unit("building", "barbarians_battlearena", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_battlearena", "return_on_dismantle", "remove", "grout")
D:modify_unit("trainingsite", "barbarians_battlearena", "soldier_capacity", 5)
end -- if N
D:modify_unit("productionsite", "barbarians_battlearena", "programs", "set", "upgrade_soldier_evade_0", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("barbarians_building", "upgrading soldier evade from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:evade level:0",
            "return=failed unless site has barbarians_bread",
            "return=failed unless site has beer_strong",
            "sleep=duration:15s",
            "animate=working duration:15s",
            "checksoldier=soldier:evade level:0",
            "consume=barbarians_bread beer_strong",
            "train=soldier:evade level:1"
         }
      })
D:modify_unit("productionsite", "barbarians_battlearena", "programs", "set", "upgrade_soldier_evade_1", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("barbarians_building", "upgrading soldier evade from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:evade level:1",
            "return=failed unless site has barbarians_bread:2",
            "return=failed unless site has fish,meat",
            "return=failed unless site has beer_strong",
            "sleep=duration:15s",
            "animate=working duration:15s",
            "checksoldier=soldier:evade level:1",
            "consume=barbarians_bread:2 fish,meat beer_strong",
            "train=soldier:evade level:2"
         }
      })

if N then
D:modify_unit("building", "barbarians_trainingcamp", "buildcost", "remove", "gold")
D:modify_unit("building", "barbarians_trainingcamp", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_trainingcamp", "buildcost", "set", "grout", 1)
D:modify_unit("building", "barbarians_trainingcamp", "return_on_dismantle", "remove", "gold")
D:modify_unit("building", "barbarians_trainingcamp", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_trainingcamp", "return_on_dismantle", "set", "grout", 1)
D:modify_unit("trainingsite", "barbarians_trainingcamp", "soldier_capacity", 8)
end -- if N
D:modify_unit("productionsite", "barbarians_trainingcamp", "input", "modify_ware", "fish",             12)
D:modify_unit("productionsite", "barbarians_trainingcamp", "input", "modify_ware", "meat",              8)
D:modify_unit("productionsite", "barbarians_trainingcamp", "input", "modify_ware", "barbarians_bread", 16)
D:modify_unit("productionsite", "barbarians_trainingcamp", "input", "modify_ware", "ax_sharp",    5)
D:modify_unit("productionsite", "barbarians_trainingcamp", "input", "modify_ware", "ax_broad",    4)
D:modify_unit("productionsite", "barbarians_trainingcamp", "input", "modify_ware", "ax_bronze",   3)
D:modify_unit("productionsite", "barbarians_trainingcamp", "input", "modify_ware", "ax_battle",   2)
D:modify_unit("productionsite", "barbarians_trainingcamp", "input", "modify_ware", "ax_warriors", 1)
D:modify_unit("productionsite", "barbarians_trainingcamp", "input", "modify_ware", "helmet",         3)
D:modify_unit("productionsite", "barbarians_trainingcamp", "input", "modify_ware", "helmet_mask",    2)
D:modify_unit("productionsite", "barbarians_trainingcamp", "input", "modify_ware", "helmet_warhelm", 1)
D:modify_unit("productionsite", "barbarians_trainingcamp", "programs", "set", "sleep", {
         -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
         descname = _"sleeping", actions = {
            "sleep=duration:100ms",
            "return=skipped",
         }})
D:modify_unit("productionsite", "barbarians_trainingcamp", "programs", "set", "upgrade_soldier_attack_0", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("barbarians_building", "upgrading soldier attack from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:attack level:0",
            "return=failed unless site has ax_sharp",
            "sleep=duration:10s",
            "checksoldier=soldier:attack level:0",
            "consume=ax_sharp",
            "train=soldier:attack level:1"
         }
      })
D:modify_unit("productionsite", "barbarians_trainingcamp", "programs", "set", "upgrade_soldier_attack_1", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("barbarians_building", "upgrading soldier attack from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:attack level:1",
            "return=failed unless site has ax_broad",
            "return=failed unless site has barbarians_bread",
            "sleep=duration:15s",
            "checksoldier=soldier:attack level:1",
            "consume=ax_broad barbarians_bread",
            "train=soldier:attack level:2"
         }
      })
D:modify_unit("productionsite", "barbarians_trainingcamp", "programs", "set", "upgrade_soldier_attack_2", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("barbarians_building", "upgrading soldier attack from level 2 to level 3"),
         actions = {
            "checksoldier=soldier:attack level:2",
            "return=failed unless site has ax_bronze",
            "return=failed unless site has fish,meat",
            "return=failed unless site has barbarians_bread",
            "sleep=duration:30s",
            "checksoldier=soldier:attack level:2",
            "consume=ax_bronze fish,meat barbarians_bread",
            "train=soldier:attack level:3"
         }
      })
D:modify_unit("productionsite", "barbarians_trainingcamp", "programs", "set", "upgrade_soldier_attack_3", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("barbarians_building", "upgrading soldier attack from level 3 to level 4"),
         actions = {
            "checksoldier=soldier:attack level:3",
            "return=failed unless site has ax_battle",
            "return=failed unless site has fish,meat",
            "return=failed unless site has barbarians_bread:3",
            "sleep=duration:60s",
            "checksoldier=soldier:attack level:3",
            "consume=ax_battle fish,meat barbarians_bread:3",
            "train=soldier:attack level:4"
         }
      })
D:modify_unit("productionsite", "barbarians_trainingcamp", "programs", "set", "upgrade_soldier_attack_4", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("barbarians_building", "upgrading soldier attack from level 4 to level 5"),
         actions = {
            "checksoldier=soldier:attack level:4",
            "return=failed unless site has ax_warriors",
            "return=failed unless site has fish,meat",
            "return=failed unless site has barbarians_bread:5",
            "sleep=duration:80s",
            "checksoldier=soldier:attack level:4",
            "consume=ax_warriors fish,meat barbarians_bread:5",
            "train=soldier:attack level:5"
         }
      })
D:modify_unit("productionsite", "barbarians_trainingcamp", "programs", "set", "upgrade_soldier_health_0", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("barbarians_building", "upgrading soldier health from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:health level:0",
            "return=failed unless site has helmet",
            "return=failed unless site has barbarians_bread",
            "sleep=duration:20s",
            "checksoldier=soldier:health level:0",
            "consume=helmet barbarians_bread",
            "train=soldier:health level:1"
         }
      })
D:modify_unit("productionsite", "barbarians_trainingcamp", "programs", "set", "upgrade_soldier_health_1", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("barbarians_building", "upgrading soldier health from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:health level:1",
            "return=failed unless site has helmet_mask",
            "return=failed unless site has barbarians_bread:2",
            "sleep=duration:40s",
            "checksoldier=soldier:health level:1",
            "consume=helmet_mask barbarians_bread:2",
            "train=soldier:health level:2"
         }
      })
D:modify_unit("productionsite", "barbarians_trainingcamp", "programs", "set", "upgrade_soldier_health_2", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("barbarians_building", "upgrading soldier health from level 2 to level 3"),
         actions = {
            "checksoldier=soldier:health level:2",
            "return=failed unless site has helmet_warhelm",
            "return=failed unless site has fish,meat",
            "return=failed unless site has barbarians_bread:3",
            "sleep=duration:60s",
            "checksoldier=soldier:health level:2",
            "consume=helmet_warhelm fish,meat barbarians_bread:3",
            "train=soldier:health level:3"
         }
      })
