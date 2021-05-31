----------------------------------------------------------------------------------------------
--                         Barbarian productionsites
----------------------------------------------------------------------------------------------

if N then
D:modify_unit("building", "barbarians_hunters_hut", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_hunters_hut", "buildcost", "remove", "granite")
D:modify_unit("building", "barbarians_hunters_hut", "buildcost", "set", "grout", 8)
D:modify_unit("building", "barbarians_hunters_hut", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_hunters_hut", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_hunters_hut", "return_on_dismantle", "set", "grout", 1)

D:modify_unit("building", "barbarians_gamekeepers_hut", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_gamekeepers_hut", "buildcost", "set", "granite", 12)
D:modify_unit("building", "barbarians_gamekeepers_hut", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_gamekeepers_hut", "return_on_dismantle", "set", "granite", 4)

D:modify_unit("building", "barbarians_quarry", "buildcost", "set", "log", 3)

D:modify_unit("building", "barbarians_scouts_hut", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_scouts_hut", "buildcost", "set", "grout", 2)
D:modify_unit("building", "barbarians_scouts_hut", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_scouts_hut", "return_on_dismantle", "set", "grout", 1)

D:modify_unit("building", "barbarians_bakery", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_bakery", "buildcost", "remove", "granite")
D:modify_unit("building", "barbarians_bakery", "buildcost", "remove", "reed")
D:modify_unit("building", "barbarians_bakery", "buildcost", "set", "blackwood", 7)
D:modify_unit("building", "barbarians_bakery", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_bakery", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_bakery", "return_on_dismantle", "remove", "reed")
D:modify_unit("building", "barbarians_bakery", "return_on_dismantle", "set", "blackwood", 2)

D:modify_unit("building", "barbarians_rangers_hut", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_rangers_hut", "buildcost", "set", "blackwood", 3)
D:modify_unit("building", "barbarians_rangers_hut", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_rangers_hut", "return_on_dismantle", "set", "blackwood", 1)

D:modify_unit("building", "barbarians_reed_yard", "buildcost", "remove", "granite")
D:modify_unit("building", "barbarians_reed_yard", "buildcost", "set", "log", 3)
D:modify_unit("building", "barbarians_reed_yard", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_reed_yard", "return_on_dismantle", "set", "log", 2)

D:modify_unit("building", "barbarians_micro_brewery", "buildcost", "remove", "reed")
D:modify_unit("building", "barbarians_micro_brewery", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_micro_brewery", "buildcost", "remove", "granite")
D:modify_unit("building", "barbarians_micro_brewery", "buildcost", "set", "blackwood", 7)
D:modify_unit("building", "barbarians_micro_brewery", "return_on_dismantle", "remove", "reed")
D:modify_unit("building", "barbarians_micro_brewery", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_micro_brewery", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_micro_brewery", "return_on_dismantle", "set", "blackwood", 3)

D:modify_unit("building", "barbarians_micro_brewery", "enhancement_cost", "remove", "reed")
D:modify_unit("building", "barbarians_micro_brewery", "enhancement_cost", "remove", "log")
D:modify_unit("building", "barbarians_micro_brewery", "enhancement_cost", "remove", "granite")
D:modify_unit("building", "barbarians_micro_brewery", "enhancement_cost", "set", "blackwood", 5)
D:modify_unit("building", "barbarians_micro_brewery", "enhancement_return_on_dismantle", "remove", "reed")
D:modify_unit("building", "barbarians_micro_brewery", "enhancement_return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_micro_brewery", "enhancement_return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_micro_brewery", "enhancement_return_on_dismantle", "set", "blackwood", 1)

D:modify_unit("building", "barbarians_smelting_works", "buildcost", "remove", "granite")
D:modify_unit("building", "barbarians_smelting_works", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_smelting_works", "buildcost", "remove", "reed")
D:modify_unit("building", "barbarians_smelting_works", "buildcost", "remove", "grout")
D:modify_unit("building", "barbarians_smelting_works", "buildcost", "set", "blackwood", 5)
D:modify_unit("building", "barbarians_smelting_works", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_smelting_works", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_smelting_works", "return_on_dismantle", "remove", "reed")
D:modify_unit("building", "barbarians_smelting_works", "return_on_dismantle", "remove", "grout")
D:modify_unit("building", "barbarians_smelting_works", "return_on_dismantle", "set", "blackwood", 3)

D:modify_unit("building", "barbarians_helmsmithy", "buildcost", "remove", "granite")
D:modify_unit("building", "barbarians_helmsmithy", "buildcost", "remove", "blackwood")
D:modify_unit("building", "barbarians_helmsmithy", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_helmsmithy", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_helmsmithy", "return_on_dismantle", "remove", "blackwood")
D:modify_unit("building", "barbarians_helmsmithy", "return_on_dismantle", "remove", "log")

D:modify_unit("building", "barbarians_metal_workshop", "buildcost", "remove", "blackwood")
D:modify_unit("building", "barbarians_metal_workshop", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_metal_workshop", "buildcost", "remove", "grout")
D:modify_unit("building", "barbarians_metal_workshop", "buildcost", "remove", "granite")
D:modify_unit("building", "barbarians_metal_workshop", "buildcost", "set", "reed", 2)
D:modify_unit("building", "barbarians_metal_workshop", "return_on_dismantle", "remove", "blackwood")
D:modify_unit("building", "barbarians_metal_workshop", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_metal_workshop", "return_on_dismantle", "remove", "grout")
D:modify_unit("building", "barbarians_metal_workshop", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_metal_workshop", "return_on_dismantle", "set", "reed", 1)

D:modify_unit("building", "barbarians_metal_workshop", "enhancement_cost", "remove", "blackwood")
D:modify_unit("building", "barbarians_metal_workshop", "enhancement_cost", "remove", "log")
D:modify_unit("building", "barbarians_metal_workshop", "enhancement_cost", "remove", "grout")
D:modify_unit("building", "barbarians_metal_workshop", "enhancement_cost", "remove", "granite")
D:modify_unit("building", "barbarians_metal_workshop", "enhancement_cost", "set", "reed", 1)
D:modify_unit("building", "barbarians_metal_workshop", "enhancement_return_on_dismantle", "remove", "blackwood")
D:modify_unit("building", "barbarians_metal_workshop", "enhancement_return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_metal_workshop", "enhancement_return_on_dismantle", "remove", "grout")
D:modify_unit("building", "barbarians_metal_workshop", "enhancement_return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_metal_workshop", "enhancement_return_on_dismantle", "set", "reed", 1)

D:modify_unit("building", "barbarians_ax_workshop", "enhancement_cost", "remove", "blackwood")
D:modify_unit("building", "barbarians_ax_workshop", "enhancement_cost", "remove", "granite")
D:modify_unit("building", "barbarians_ax_workshop", "enhancement_cost", "remove", "grout")
D:modify_unit("building", "barbarians_ax_workshop", "enhancement_cost", "remove", "reed")
D:modify_unit("building", "barbarians_ax_workshop", "enhancement_cost", "set", "log", 12)
D:modify_unit("building", "barbarians_ax_workshop", "enhancement_return_on_dismantle", "remove", "blackwood")
D:modify_unit("building", "barbarians_ax_workshop", "enhancement_return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_ax_workshop", "enhancement_return_on_dismantle", "remove", "grout")
D:modify_unit("building", "barbarians_ax_workshop", "enhancement_return_on_dismantle", "remove", "reed")
D:modify_unit("building", "barbarians_ax_workshop", "enhancement_return_on_dismantle", "set", "log", 4)

D:modify_unit("building", "barbarians_fishers_hut", "buildcost", "set", "log", 2)
D:modify_unit("building", "barbarians_fishers_hut", "return_on_dismantle", "set", "log", 1)

D:modify_unit("building", "barbarians_well", "buildcost", "set", "log", 1)
D:modify_unit("building", "barbarians_well", "return_on_dismantle", "set", "log", 1)

D:modify_unit("building", "barbarians_barracks", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_barracks", "buildcost", "remove", "reed")
D:modify_unit("building", "barbarians_barracks", "buildcost", "remove", "grout")
D:modify_unit("building", "barbarians_barracks", "buildcost", "set", "granite", 7)
D:modify_unit("building", "barbarians_barracks", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_barracks", "return_on_dismantle", "remove", "reed")
D:modify_unit("building", "barbarians_barracks", "return_on_dismantle", "remove", "grout")
D:modify_unit("building", "barbarians_barracks", "return_on_dismantle", "set", "granite", 3)

D:modify_unit("building", "barbarians_lime_kiln", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_lime_kiln", "buildcost", "remove", "granite")
D:modify_unit("building", "barbarians_lime_kiln", "buildcost", "set", "blackwood", 5)
D:modify_unit("building", "barbarians_lime_kiln", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_lime_kiln", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_lime_kiln", "return_on_dismantle", "set", "blackwood", 1)

D:modify_unit("building", "barbarians_farm", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_farm", "buildcost", "remove", "granite")
D:modify_unit("building", "barbarians_farm", "buildcost", "remove", "blackwood")
D:modify_unit("building", "barbarians_farm", "buildcost", "set", "grout", 5)
D:modify_unit("building", "barbarians_farm", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_farm", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_farm", "return_on_dismantle", "remove", "blackwood")
D:modify_unit("building", "barbarians_farm", "return_on_dismantle", "set", "grout", 3)

D:modify_unit("building", "barbarians_tavern", "buildcost", "remove", "granite")
D:modify_unit("building", "barbarians_tavern", "buildcost", "remove", "reed")
D:modify_unit("building", "barbarians_tavern", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_tavern", "buildcost", "set", "blackwood", 5)
D:modify_unit("building", "barbarians_tavern", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_tavern", "return_on_dismantle", "remove", "reed")
D:modify_unit("building", "barbarians_tavern", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_tavern", "return_on_dismantle", "set", "blackwood", 3)

D:modify_unit("building", "barbarians_tavern", "enhancement_cost", "remove", "log")
D:modify_unit("building", "barbarians_tavern", "enhancement_cost", "remove", "reed")
D:modify_unit("building", "barbarians_tavern", "enhancement_cost", "remove", "grout")
D:modify_unit("building", "barbarians_tavern", "enhancement_cost", "set", "blackwood", 12)
D:modify_unit("building", "barbarians_tavern", "enhancement_return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_tavern", "enhancement_return_on_dismantle", "remove", "reed")
D:modify_unit("building", "barbarians_tavern", "enhancement_return_on_dismantle", "remove", "grout")
D:modify_unit("building", "barbarians_tavern", "enhancement_return_on_dismantle", "set", "blackwood", 3)

D:modify_unit("building", "barbarians_inn", "enhancement_cost", "remove", "log")
D:modify_unit("building", "barbarians_inn", "enhancement_cost", "remove", "reed")
D:modify_unit("building", "barbarians_inn", "enhancement_cost", "set", "grout", 10)
D:modify_unit("building", "barbarians_inn", "enhancement_cost", "set", "blackwood", 10)
D:modify_unit("building", "barbarians_inn", "enhancement_return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_inn", "enhancement_return_on_dismantle", "remove", "reed")
D:modify_unit("building", "barbarians_inn", "enhancement_return_on_dismantle", "set", "grout", 1)
D:modify_unit("building", "barbarians_inn", "enhancement_return_on_dismantle", "set", "blackwood", 1)

D:modify_unit("building", "barbarians_coalmine", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_coalmine", "buildcost", "set", "granite", 3)
D:modify_unit("building", "barbarians_coalmine", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_coalmine", "return_on_dismantle", "set", "granite", 1)

D:modify_unit("building", "barbarians_coalmine", "enhancement_cost", "remove", "log")
D:modify_unit("building", "barbarians_coalmine", "enhancement_cost", "remove", "granite")
D:modify_unit("building", "barbarians_coalmine", "enhancement_cost", "set", "grout", 7)
D:modify_unit("building", "barbarians_coalmine", "enhancement_return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_coalmine", "enhancement_return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_coalmine", "enhancement_return_on_dismantle", "set", "grout", 2)

D:modify_unit("building", "barbarians_coalmine_deep", "enhancement_cost", "remove", "log")
D:modify_unit("building", "barbarians_coalmine_deep", "enhancement_cost", "remove", "granite")
D:modify_unit("building", "barbarians_coalmine_deep", "enhancement_cost", "set", "grout", 5)
D:modify_unit("building", "barbarians_coalmine_deep", "enhancement_return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_coalmine_deep", "enhancement_return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_coalmine_deep", "enhancement_return_on_dismantle", "set", "grout", 1)

D:modify_unit("building", "barbarians_granitemine", "buildcost", "remove", "granite")
D:modify_unit("building", "barbarians_granitemine", "buildcost", "set", "log", 5)
D:modify_unit("building", "barbarians_granitemine", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_granitemine", "return_on_dismantle", "set", "log", 1)

D:modify_unit("building", "barbarians_ironmine", "buildcost", "remove", "granite")
D:modify_unit("building", "barbarians_ironmine", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_ironmine", "buildcost", "set", "blackwood", 3)
D:modify_unit("building", "barbarians_ironmine", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_ironmine", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_ironmine", "return_on_dismantle", "set", "blackwood", 1)

D:modify_unit("building", "barbarians_ironmine", "enhancement_cost", "remove", "log")
D:modify_unit("building", "barbarians_ironmine", "enhancement_cost", "remove", "granite")
D:modify_unit("building", "barbarians_ironmine", "enhancement_cost", "set", "blackwood", 5)
D:modify_unit("building", "barbarians_ironmine", "enhancement_return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_ironmine", "enhancement_return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_ironmine", "enhancement_return_on_dismantle", "set", "blackwood", 2)

D:modify_unit("building", "barbarians_ironmine_deep", "enhancement_cost", "remove", "log")
D:modify_unit("building", "barbarians_ironmine_deep", "enhancement_cost", "remove", "granite")
D:modify_unit("building", "barbarians_ironmine_deep", "enhancement_cost", "set", "blackwood", 5)
D:modify_unit("building", "barbarians_ironmine_deep", "enhancement_return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_ironmine_deep", "enhancement_return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_ironmine_deep", "enhancement_return_on_dismantle", "set", "blackwood", 2)

D:modify_unit("building", "barbarians_goldmine", "enhancement_cost", "remove", "log")
D:modify_unit("building", "barbarians_goldmine", "enhancement_cost", "remove", "granite")
D:modify_unit("building", "barbarians_goldmine", "enhancement_cost", "set", "blackwood", 10)
D:modify_unit("building", "barbarians_goldmine", "enhancement_return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_goldmine", "enhancement_return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_goldmine", "enhancement_return_on_dismantle", "set", "blackwood", 4)

D:modify_unit("building", "barbarians_goldmine_deep", "enhancement_cost", "remove", "log")
D:modify_unit("building", "barbarians_goldmine_deep", "enhancement_cost", "remove", "granite")
D:modify_unit("building", "barbarians_goldmine_deep", "enhancement_cost", "set", "blackwood", 15)
D:modify_unit("building", "barbarians_goldmine_deep", "enhancement_return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_goldmine_deep", "enhancement_return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_goldmine_deep", "enhancement_return_on_dismantle", "set", "blackwood", 5)
end -- if N

D:modify_unit("productionsite", "barbarians_scouts_hut", "input", "modify_ware", "ration", 25)
D:modify_unit("productionsite", "barbarians_scouts_hut", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start scouting because ...
         descname = _"scouting",
         actions = {
            "consume=ration:25",
            "sleep=duration:30s",
            "callworker=scout"
         }
      })
D:modify_unit("productionsite", "barbarians_scouts_hut", "programs", "set", "targeted_scouting", {
         descname = _"scouting",
         actions = {
            "consume=ration:25",
            "callworker=targeted_scouting"
         }
      })

D:modify_unit("productionsite", "barbarians_wood_hardener", "input", "modify_ware", "log", 3)
D:modify_unit("productionsite", "barbarians_wood_hardener", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start hardening wood because ...
         descname = _"hardening wood",
         actions = {
            "return=skipped unless economy needs blackwood",
            "consume=log",
            "sleep=duration:28s",
            "playsound=sound/barbarians/blackwood priority:60%",
            "animate=working duration:24s",
            "produce=blackwood:2"
         }
      })

D:modify_unit("productionsite", "barbarians_bakery", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start baking bread because ...
         descname = pgettext("barbarians_building", "baking pitta bread"),
         actions = {
            "return=skipped unless economy needs barbarians_bread",
            "consume=water:2 wheat:2",
            "sleep=duration:20s",
            "animate=working duration:20s",
            "produce=barbarians_bread:2",
            "animate=working duration:20s",
            "produce=barbarians_bread:2"
         }
      })

D:modify_unit("productionsite", "barbarians_coalmine", "programs", "set", "mine_produce", {
         -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
         descname = _"mining coal",
         actions = {
            "animate=working duration:10s",
            "mine=resource_coal radius:2 yield:33.33% when_empty:5% experience_on_fail:17%",
            "produce=coal:2",
         }
      })
D:modify_unit("productionsite", "barbarians_coalmine", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
         descname = _"mining coal",
         actions = {
            "return=skipped unless economy needs coal",
            "consume=ration",
            "sleep=duration:45s",
            "call=mine_produce",
            "call=mine_produce",
         }
      })

D:modify_unit("productionsite", "barbarians_coalmine_deep", "programs", "set", "mine_produce", {
         -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
         descname = _"mining coal",
         actions = {
            "animate=working duration:9s500ms",
            "mine=resource_coal radius:2 yield:66.66% when_empty:5% experience_on_fail:17%",
            "produce=coal:2",
         }
      })
D:modify_unit("productionsite", "barbarians_coalmine_deep", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
         descname = _"mining coal",
         actions = {
            "return=skipped unless economy needs coal",
            "consume=snack",
            "sleep=duration:40s",
            "call=mine_produce",
            "call=mine_produce",
            "call=mine_produce",
            "call=mine_produce",
         }
      })

D:modify_unit("productionsite", "barbarians_coalmine_deeper", "programs", "set", "mine_produce", {
         -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
         descname = _"mining coal",
         actions = {
            "animate=working duration:7s",
            "mine=resource_coal radius:2 yield:100% when_empty:10% experience_on_fail:2%",
            "produce=coal:4",
         }
      })
D:modify_unit("productionsite", "barbarians_coalmine_deeper", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
         descname = _"mining coal",
         actions = {
            "return=skipped unless economy needs coal",
            "consume=meal",
            "sleep=duration:37s",
            "call=mine_produce",
            "call=mine_produce",
            "call=mine_produce",
            "call=mine_produce",
            "call=mine_produce",
         }
      })

D:modify_unit("productionsite", "barbarians_goldmine", "input", "modify_ware", "ration", 5)
D:modify_unit("productionsite", "barbarians_goldmine", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start mining gold because ...
         descname = _"mining gold",
         actions = {
            "return=skipped unless economy needs gold_ore",
            "consume=ration:3",
            "sleep=duration:45s",
            "animate=working duration:20s",
            "mine=resource_gold radius:2 yield:33.33% when_empty:5% experience_on_fail:17%",
            "produce=gold_ore"
         }
      })

D:modify_unit("productionsite", "barbarians_tavern", "input", "modify_ware", "barbarians_bread", 3)
D:modify_unit("productionsite", "barbarians_tavern", "input", "modify_ware", "meat", 3)
D:modify_unit("productionsite", "barbarians_tavern", "input", "modify_ware", "fish", 3)

D:modify_unit("productionsite", "barbarians_inn", "input", "modify_ware", "fish", 5)
D:modify_unit("productionsite", "barbarians_inn", "input", "modify_ware", "meat", 8)
D:modify_unit("productionsite", "barbarians_inn", "input", "modify_ware", "beer", 3)
D:modify_unit("productionsite", "barbarians_inn", "input", "modify_ware", "barbarians_bread", 6)
D:modify_unit("productionsite", "barbarians_inn", "programs", "set", "produce_snack_3", {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack because ...
         descname = _"preparing a snack",
         actions = {
            "return=skipped unless economy needs snack",
            "consume=barbarians_bread:3 fish,meat:2 beer",
            "playsound=sound/barbarians/taverns/inn priority:80%",
            "animate=working duration:23s",
            "sleep=duration:10s",
            "produce=snack:2"
         }
      })
D:modify_unit("productionsite", "barbarians_inn", "programs", "set", "produce_snack", {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack because ...
         descname = _"preparing a snack",
         actions = {
            "return=skipped unless economy needs snack",
            "consume=barbarians_bread fish,meat beer",
            "playsound=sound/barbarians/taverns/inn priority:80%",
            "animate=working duration:27s",
            "sleep=duration:10s",
            "produce=snack"
         }
      })
D:modify_unit("productionsite", "barbarians_inn", "programs", "set", "produce_snack_2", {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack because ...
         descname = _"preparing a snack",
         actions = {
            "return=skipped unless economy needs snack",
            "consume=barbarians_bread:3 beer",
            "playsound=sound/barbarians/taverns/inn priority:80%",
            "animate=working duration:27s",
            "sleep=duration:25s",
            "produce=snack"
         }
      })
D:modify_unit("productionsite", "barbarians_inn", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_snack_3",
            "call=produce_snack",
            "call=produce_snack_2",
            "return=skipped"
         }
      })

D:modify_unit("productionsite", "barbarians_big_inn", "input", "modify_ware", "fish", 2)
D:modify_unit("productionsite", "barbarians_big_inn", "input", "modify_ware", "meat", 8)
D:modify_unit("productionsite", "barbarians_big_inn", "input", "modify_ware", "beer", 2)
D:modify_unit("productionsite", "barbarians_big_inn", "input", "modify_ware", "beer_strong", 5)
D:modify_unit("productionsite", "barbarians_big_inn", "input", "modify_ware", "barbarians_bread", 6)
D:modify_unit("productionsite", "barbarians_big_inn", "input", "add_ware", "reed", 6)
D:modify_unit("productionsite", "barbarians_big_inn", "input", "add_ware", "coal", 4)
D:modify_unit("productionsite", "barbarians_big_inn", "input", "add_ware", "wheat", 3)
D:modify_unit("productionsite", "barbarians_big_inn", "input", "add_ware", "water", 2)
D:modify_unit("productionsite", "barbarians_big_inn", "programs", "set", "produce_meal_4", {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
         descname = _"preparing a ration",
         actions = {
            "return=skipped unless economy needs ration",
            "consume=reed:3 coal:2 barbarians_bread:2 beer_strong beer",
            "playsound=sound/barbarians/taverns/tavern priority:80%",
            "animate=working duration:23s",
            "sleep=duration:10s",
            "produce=meal:3"
         }
      })
D:modify_unit("productionsite", "barbarians_big_inn", "programs", "set", "produce_meal_3", {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack because ...
         descname = _"preparing a snack",
         actions = {
            "return=skipped unless economy needs snack",
            "consume=reed:3 barbarians_bread:3 beer_strong",
            "playsound=sound/barbarians/taverns/biginn priority:80%",
            "animate=working duration:27s",
            "sleep=duration:10s",
            "produce=meal:2"
         }
      })
D:modify_unit("productionsite", "barbarians_big_inn", "programs", "set", "produce_meal", {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a meal because ...
         descname = _"preparing a meal",
         actions = {
            "return=skipped unless economy needs meal",
            "consume=barbarians_bread fish,meat beer_strong",
            "playsound=sound/barbarians/taverns/biginn priority:80%",
            "animate=working duration:30s",
            "sleep=duration:10s",
            "produce=meal"
         }
      })
D:modify_unit("productionsite", "barbarians_big_inn", "programs", "set", "produce_meal_5", {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a meal because ...
         descname = _"preparing a meal",
         actions = {
            "consume=barbarians_bread water:2 wheat",
            "playsound=sound/barbarians/taverns/biginn priority:80%",
            "animate=working duration:30s",
            "sleep=duration:10s",
            "produce=fish:2"
         }
      })
D:modify_unit("productionsite", "barbarians_big_inn", "programs", "set", "produce_meal_6", {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a meal because ...
         descname = _"preparing a meal",
         actions = {
            "return=skipped unless economy needs iron",
            "consume=reed water barbarians_bread coal",
            "playsound=sound/barbarians/taverns/biginn priority:80%",
            "animate=working duration:30s",
            "sleep=duration:10s",
            "produce=iron"
         }
      })
D:modify_unit("productionsite", "barbarians_big_inn", "programs", "set", "produce_meal_2", {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a meal because ...
         descname = _"preparing a meal",
         actions = {
            "return=skipped unless economy needs meal",
            "consume=barbarians_bread:3 beer_strong",
            "playsound=sound/barbarians/taverns/biginn priority:80%",
            "animate=working duration:30s",
            "sleep=duration:25s",
            "produce=meal"
         }
      })
D:modify_unit("productionsite", "barbarians_big_inn", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_meal_4",
            "call=produce_meal_3",
            "call=produce_meal",
            "call=produce_meal_2",
            "call=produce_meal_5",
            "call=produce_meal_6",
            "return=skipped"
         }
      })

D:modify_unit("productionsite", "barbarians_smelting_works", "input", "modify_ware", "coal", 3)
D:modify_unit("productionsite", "barbarians_smelting_works", "input", "modify_ware", "iron_ore", 3)
D:modify_unit("productionsite", "barbarians_smelting_works", "input", "modify_ware", "gold_ore", 12)
D:modify_unit("productionsite", "barbarians_smelting_works", "programs", "set", "smelt_iron", {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
         descname = _"smelting iron",
         actions = {
            "return=skipped unless economy needs iron",
            "consume=coal iron_ore",
            "sleep=duration:29s",
            "playsound=sound/metal/furnace priority:50% allow_multiple",
            "animate=working duration:35s",
            "playsound=sound/metal/ironping priority:60%",
            "produce=iron:2"
         }
      })
D:modify_unit("productionsite", "barbarians_smelting_works", "programs", "set", "smelt_iron_2", {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
         descname = _"smelting iron",
         actions = {
            "return=skipped unless economy needs iron",
            "consume=coal iron_ore",
            "sleep=duration:29s",
            "playsound=sound/metal/furnace priority:50% allow_multiple",
            "animate=working duration:35s",
            "playsound=sound/metal/ironping priority:60%",
            "produce=iron:2"
         }
      })
D:modify_unit("productionsite", "barbarians_smelting_works", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=smelt_iron",
            "call=smelt_gold",
            "call=smelt_iron_2",
            "return=skipped"
         }
      })

D:modify_unit("productionsite", "barbarians_helmsmithy", "input", "remove_ware", "gold")
D:modify_unit("productionsite", "barbarians_helmsmithy", "programs", "set", "produce_helmet", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a helmet because ...
         descname = _"forging a helmet",
         actions = {
            "return=skipped unless economy needs helmet",
            "consume=iron",
            "sleep=duration:32s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:35s",
            "produce=helmet"
         }
      })
D:modify_unit("productionsite", "barbarians_helmsmithy", "programs", "set", "produce_helmet_mask", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a mask because ...
         descname = _"forging a mask",
         actions = {
            "return=skipped unless economy needs helmet_mask",
            "consume=coal:2 iron",
            "sleep=duration:32s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:45s",
            "produce=helmet_mask"
         }
      })
D:modify_unit("productionsite", "barbarians_helmsmithy", "programs", "set", "produce_helmet_warhelm", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a warhelm because ...
         descname = _"forging a warhelm",
         actions = {
            "return=skipped unless economy needs helmet_warhelm",
            "consume=coal:2 iron:3",
            "sleep=duration:32s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:55s",
            "produce=helmet_warhelm"
         }
      })
D:modify_unit("productionsite", "barbarians_helmsmithy", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_helmet",
            "call=produce_helmet_mask",
            "call=produce_helmet_warhelm",
            "return=skipped"
         }
      })

D:modify_unit("productionsite", "barbarians_metal_workshop", "input", "modify_ware", "iron", 2)
D:modify_unit("productionsite", "barbarians_metal_workshop", "input", "modify_ware", "log", 3)
D:modify_unit("productionsite", "barbarians_metal_workshop", "programs", "set", "produce_felling_ax", {
         -- TRANSLATORS: Completed/Skipped/Did not start making a felling ax because ...
         descname = _"making a felling ax",
         actions = {
            "return=skipped unless economy needs felling_ax",
            "consume=iron:2 log:3",
            "sleep=duration:32s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s",
            "produce=felling_ax"
         }
      })
D:modify_unit("productionsite", "barbarians_metal_workshop", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_bread_paddle",
            "call=produce_fire_tongs",
            "call=produce_felling_ax",
            "call=produce_fishing_rod",
            "call=produce_hammer",
            "call=produce_hunting_spear",
            "call=produce_kitchen_tools",
            "call=produce_pick",
            "call=produce_scythe",
            "call=produce_shovel",
            "return=skipped"
         }
      })

D:modify_unit("productionsite", "barbarians_ax_workshop", "input", "modify_ware", "coal", 5)
D:modify_unit("productionsite", "barbarians_ax_workshop", "programs", "set", "produce_ax_sharp", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a sharp ax because ...
         descname = _"forging a sharp ax",
         actions = {
            "return=skipped unless economy needs ax_sharp",
            "consume=coal",
            "sleep=duration:26s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:22s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=ax_sharp"
         }
      })
D:modify_unit("productionsite", "barbarians_ax_workshop", "programs", "set", "produce_ax_broad", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a broad ax because ...
         descname = _"forging a broad ax",
         actions = {
            "return=skipped unless economy needs ax_broad",
            "consume=coal:2 iron",
            "sleep=duration:26s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:22s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=ax_broad"
         }
      })
D:modify_unit("productionsite", "barbarians_ax_workshop", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_ax",
            "call=produce_ax_sharp",
            "call=produce_ax_broad",
            "return=skipped"
         }
      })

D:modify_unit("productionsite", "barbarians_warmill", "programs", "set", "produce_ax_sharp", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a sharp ax because ...
         descname = _"forging a sharp ax",
         actions = {
            "return=skipped unless economy needs ax_sharp",
            "consume=coal",
            "sleep=duration:26s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:22s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=ax_sharp"
         }
      })
D:modify_unit("productionsite", "barbarians_warmill", "programs", "set", "produce_ax_broad", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a broad ax because ...
         descname = _"forging a broad ax",
         actions = {
            "return=skipped unless economy needs ax_broad",
            "consume=coal iron",
            "sleep=duration:26s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:22s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=ax_broad"
         }
      })
D:modify_unit("productionsite", "barbarians_warmill", "programs", "set", "produce_ax_bronze", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a bronze ax because ...
         descname = _"forging a bronze ax",
         actions = {
            "return=skipped unless economy needs ax_bronze",
            "consume=coal:3 iron",
            "sleep=duration:26s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:22s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=ax_bronze"
         }
      })
D:modify_unit("productionsite", "barbarians_warmill", "programs", "set", "produce_ax_battle", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a battle ax because ...
         descname = _"forging a battle ax",
         actions = {
            "return=skipped unless economy needs ax_battle",
            "consume=coal:2 gold iron:3",
            "sleep=duration:26s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:22s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=ax_battle"
         }
      })
D:modify_unit("productionsite", "barbarians_warmill", "programs", "set", "produce_ax_warriors", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a warrior’s ax because ...
         descname = _"forging a warrior’s ax",
         actions = {
            "return=skipped unless economy needs ax_warriors",
            "consume=coal:3 gold:3 iron:4",
            "sleep=duration:26s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:22s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=ax_warriors"
         }
      })
D:modify_unit("productionsite", "barbarians_warmill", "programs", "set", "produce_ax_battle_2", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a battle ax because ...
         descname = _"forging a battle ax",
         actions = {
            "return=skipped unless economy needs ax_battle",
            "consume=coal:4 iron:6",
            "sleep=duration:26s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:22s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=ax_battle"
         }
      })
D:modify_unit("productionsite", "barbarians_warmill", "programs", "set", "produce_ax_warriors_2", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a warrior’s ax because ...
         descname = _"forging a warrior’s ax",
         actions = {
            "return=skipped unless economy needs ax_warriors",
            "consume=coal:8 iron:8",
            "sleep=duration:26s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:22s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=ax_warriors"
         }
      })
D:modify_unit("productionsite", "barbarians_warmill", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_ax",
            "call=produce_ax_sharp",
            "call=produce_ax_broad",
            "call=produce_ax_bronze",
            "call=produce_ax_battle",
            "call=produce_ax_warriors",
            "call=produce_ax_battle_2",
            "call=produce_ax_warriors_2",
            "return=skipped"
         }
      })

D:modify_unit("productionsite", "barbarians_brewery", "input", "modify_ware", "water", 5)
D:modify_unit("productionsite", "barbarians_brewery", "input", "modify_ware", "wheat", 3)

D:modify_unit("productionsite", "barbarians_micro_brewery", "input", "modify_ware", "water", 3)
D:modify_unit("productionsite", "barbarians_micro_brewery", "input", "modify_ware", "wheat", 2)
