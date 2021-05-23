----------------------------------------------------------------------------------------------
--                         Atlantean productionsites
----------------------------------------------------------------------------------------------

if N then
D:modify_unit("building", "atlanteans_fishbreeders_house", "buildcost", "set", "log", 8)
D:modify_unit("building", "atlanteans_fishbreeders_house", "buildcost", "set", "planks", 4)
D:modify_unit("building", "atlanteans_fishbreeders_house", "buildcost", "set", "granite", 6)
D:modify_unit("building", "atlanteans_fishbreeders_house", "return_on_dismantle", "set", "log", 3)
D:modify_unit("building", "atlanteans_fishbreeders_house", "return_on_dismantle", "set", "planks", 1)
D:modify_unit("building", "atlanteans_fishbreeders_house", "return_on_dismantle", "set", "granite", 2)

D:modify_unit("building", "atlanteans_foresters_house", "buildcost", "remove", "log")
D:modify_unit("building", "atlanteans_foresters_house", "buildcost", "remove", "planks")
D:modify_unit("building", "atlanteans_foresters_house", "buildcost", "set", "granite", 3)
D:modify_unit("building", "atlanteans_foresters_house", "return_on_dismantle", "remove", "log")

D:modify_unit("building", "atlanteans_hunters_house", "buildcost", "remove", "granite")
D:modify_unit("building", "atlanteans_hunters_house", "buildcost", "set", "log", 6)
D:modify_unit("building", "atlanteans_hunters_house", "buildcost", "set", "planks", 3)
D:modify_unit("building", "atlanteans_hunters_house", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "atlanteans_hunters_house", "return_on_dismantle", "set", "log", 2)
D:modify_unit("building", "atlanteans_hunters_house", "return_on_dismantle", "set", "planks", 1)

D:modify_unit("building", "atlanteans_mill", "buildcost", "set", "log", 6)
D:modify_unit("building", "atlanteans_mill", "buildcost", "set", "granite", 6)
D:modify_unit("building", "atlanteans_mill", "buildcost", "set", "planks", 6)
D:modify_unit("building", "atlanteans_mill", "return_on_dismantle", "set", "log", 2)
D:modify_unit("building", "atlanteans_mill", "return_on_dismantle", "set", "granite", 2)
D:modify_unit("building", "atlanteans_mill", "return_on_dismantle", "set", "planks", 2)

D:modify_unit("building", "atlanteans_well", "buildcost", "remove", "log")
D:modify_unit("building", "atlanteans_well", "buildcost", "remove", "planks")
D:modify_unit("building", "atlanteans_well", "buildcost", "set", "granite", 8)
D:modify_unit("building", "atlanteans_well", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "atlanteans_well", "return_on_dismantle", "set", "granite", 3)

D:modify_unit("building", "atlanteans_spiderfarm", "buildcost", "remove", "planks")
D:modify_unit("building", "atlanteans_spiderfarm", "buildcost", "remove", "granite")
D:modify_unit("building", "atlanteans_spiderfarm", "buildcost", "set", "log", 3)
D:modify_unit("building", "atlanteans_spiderfarm", "return_on_dismantle", "remove", "planks")
D:modify_unit("building", "atlanteans_spiderfarm", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "atlanteans_spiderfarm", "return_on_dismantle", "set", "log", 1)

D:modify_unit("building", "atlanteans_coalmine", "buildcost", "remove", "spidercloth")
D:modify_unit("building", "atlanteans_coalmine", "buildcost", "remove", "planks")
D:modify_unit("building", "atlanteans_coalmine", "buildcost", "set", "log", 3)
D:modify_unit("building", "atlanteans_coalmine", "return_on_dismantle", "remove", "planks")
D:modify_unit("building", "atlanteans_coalmine", "return_on_dismantle", "set", "log", 1)

D:modify_unit("building", "atlanteans_ironmine", "buildcost", "remove", "spidercloth")
D:modify_unit("building", "atlanteans_ironmine", "buildcost", "set", "log", 2)
D:modify_unit("building", "atlanteans_ironmine", "buildcost", "set", "planks", 2)
D:modify_unit("building", "atlanteans_ironmine", "buildcost", "set", "granite", 2)

D:modify_unit("building", "atlanteans_goldmine", "buildcost", "set", "log", 4)
D:modify_unit("building", "atlanteans_goldmine", "buildcost", "set", "spidercloth", 4)
D:modify_unit("building", "atlanteans_goldmine", "buildcost", "set", "granite", 4)

D:modify_unit("building", "atlanteans_horsefarm", "buildcost", "set", "log", 12)

D:modify_unit("building", "atlanteans_smelting_works", "buildcost", "remove", "spidercloth")
D:modify_unit("building", "atlanteans_smelting_works", "buildcost", "remove", "log")
D:modify_unit("building", "atlanteans_smelting_works", "buildcost", "set", "granite", 2)
D:modify_unit("building", "atlanteans_smelting_works", "buildcost", "set", "planks", 1)
D:modify_unit("building", "atlanteans_smelting_works", "return_on_dismantle", "set", "granite", 1)

D:modify_unit("building", "atlanteans_toolsmithy", "buildcost", "remove", "log")
D:modify_unit("building", "atlanteans_toolsmithy", "buildcost", "remove", "granite")
D:modify_unit("building", "atlanteans_toolsmithy", "buildcost", "remove", "planks")
D:modify_unit("building", "atlanteans_toolsmithy", "buildcost", "set", "spidercloth", 8)
D:modify_unit("building", "atlanteans_toolsmithy", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "atlanteans_toolsmithy", "return_on_dismantle", "remove", "planks")
D:modify_unit("building", "atlanteans_toolsmithy", "return_on_dismantle", "set", "spidercloth", 2)

D:modify_unit("building", "atlanteans_armorsmithy", "buildcost", "remove", "log")
D:modify_unit("building", "atlanteans_armorsmithy", "buildcost", "remove", "granite")
D:modify_unit("building", "atlanteans_armorsmithy", "buildcost", "remove", "quartz")
D:modify_unit("building", "atlanteans_armorsmithy", "buildcost", "remove", "planks")
D:modify_unit("building", "atlanteans_armorsmithy", "buildcost", "set", "spidercloth", 3)
D:modify_unit("building", "atlanteans_armorsmithy", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "atlanteans_armorsmithy", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "atlanteans_armorsmithy", "return_on_dismantle", "remove", "quartz")
D:modify_unit("building", "atlanteans_armorsmithy", "return_on_dismantle", "remove", "planks")
D:modify_unit("building", "atlanteans_armorsmithy", "return_on_dismantle", "set", "spidercloth", 1)

D:modify_unit("building", "atlanteans_weaponsmithy", "buildcost", "remove", "log")
D:modify_unit("building", "atlanteans_weaponsmithy", "buildcost", "remove", "granite")
D:modify_unit("building", "atlanteans_weaponsmithy", "buildcost", "remove", "quartz")
D:modify_unit("building", "atlanteans_weaponsmithy", "buildcost", "remove", "planks")
D:modify_unit("building", "atlanteans_weaponsmithy", "buildcost", "set", "spidercloth", 3)
D:modify_unit("building", "atlanteans_weaponsmithy", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "atlanteans_weaponsmithy", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "atlanteans_weaponsmithy", "return_on_dismantle", "remove", "quartz")
D:modify_unit("building", "atlanteans_weaponsmithy", "return_on_dismantle", "remove", "planks")
D:modify_unit("building", "atlanteans_weaponsmithy", "return_on_dismantle", "set", "spidercloth", 1)

D:modify_unit("building", "atlanteans_smokery", "buildcost", "remove", "spidercloth")
D:modify_unit("building", "atlanteans_smokery", "buildcost", "remove", "planks")
D:modify_unit("building", "atlanteans_smokery", "buildcost", "set", "granite", 4)
D:modify_unit("building", "atlanteans_smokery", "buildcost", "set", "log", 3)

D:modify_unit("building", "atlanteans_weaving_mill", "buildcost", "remove", "log")
D:modify_unit("building", "atlanteans_weaving_mill", "buildcost", "remove", "planks")
D:modify_unit("building", "atlanteans_weaving_mill", "buildcost", "set", "granite", 3)
D:modify_unit("building", "atlanteans_weaving_mill", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "atlanteans_weaving_mill", "return_on_dismantle", "remove", "planks")
D:modify_unit("building", "atlanteans_weaving_mill", "return_on_dismantle", "set", "granite", 1)

D:modify_unit("building", "atlanteans_bakery", "buildcost", "remove", "log")

D:modify_unit("building", "atlanteans_farm", "buildcost", "remove", "log")
D:modify_unit("building", "atlanteans_farm", "buildcost", "remove", "granite")
D:modify_unit("building", "atlanteans_farm", "buildcost", "remove", "spidercloth")
D:modify_unit("building", "atlanteans_farm", "buildcost", "set", "planks", 5)
D:modify_unit("building", "atlanteans_farm", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "atlanteans_farm", "return_on_dismantle", "remove", "granite")

D:modify_unit("building", "atlanteans_blackroot_farm", "buildcost", "remove", "log")
D:modify_unit("building", "atlanteans_blackroot_farm", "buildcost", "remove", "granite")
D:modify_unit("building", "atlanteans_blackroot_farm", "buildcost", "set", "planks", 10)
D:modify_unit("building", "atlanteans_blackroot_farm", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "atlanteans_blackroot_farm", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "atlanteans_blackroot_farm", "return_on_dismantle", "set", "planks", 3)
end -- if N

D:modify_unit("productionsite", "atlanteans_scouts_house", "input", "modify_ware", "smoked_fish", 18)
D:modify_unit("productionsite", "atlanteans_scouts_house", "input", "modify_ware", "atlanteans_bread", 18)
D:modify_unit("productionsite", "atlanteans_scouts_house", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start scouting because ...
         descname = _"scouting",
         actions = {
            "consume=smoked_fish,atlanteans_bread:18",
            "sleep=duration:30s",
            "callworker=scout"
         }
      })
D:modify_unit("productionsite", "atlanteans_scouts_house", "programs", "set", "targeted_scouting", {
         descname = _"scouting",
         actions = {
            "consume=smoked_fish,atlanteans_bread:18",
            "callworker=targeted_scouting"
         }
      })

D:modify_unit("productionsite", "atlanteans_spiderfarm", "input", "modify_ware", "water", 3)
D:modify_unit("productionsite", "atlanteans_spiderfarm", "input", "modify_ware", "corn", 2)

D:modify_unit("productionsite", "atlanteans_horsefarm", "input", "modify_ware", "water", 3)
D:modify_unit("productionsite", "atlanteans_horsefarm", "input", "modify_ware", "corn", 2)

D:modify_unit("productionsite", "atlanteans_smokery", "input", "modify_ware", "fish", 6)
D:modify_unit("productionsite", "atlanteans_smokery", "input", "modify_ware", "meat", 2)
D:modify_unit("productionsite", "atlanteans_smokery", "input", "modify_ware", "log", 3)
D:modify_unit("productionsite", "atlanteans_smokery", "programs", "set", "smoke_fish", {
         -- TRANSLATORS: Completed/Skipped/Did not start smoking fish because ...
         descname = _"smoking fish",
         actions = {
            "return=skipped unless economy needs smoked_fish",
            "consume=fish:2 log",
            "animate=working duration:30s",
            "sleep=duration:30s",
            "produce=smoked_fish:3"
         }
      })
D:modify_unit("productionsite", "atlanteans_smokery", "programs", "set", "smoke_fish_2", {
         -- TRANSLATORS: Completed/Skipped/Did not start smoking fish because ...
         descname = _"smoking fish",
         actions = {
            "return=skipped unless economy needs smoked_fish",
            "consume=fish:2 log",
            "animate=working duration:30s",
            "sleep=duration:30s",
            "produce=smoked_fish:3"
         }
      })
D:modify_unit("productionsite", "atlanteans_smokery", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=smoke_fish",
            "call=smoke_meat",
            "call=smoke_fish_2",
         }
      })

D:modify_unit("productionsite", "atlanteans_armorsmithy", "programs", "set", "produce_shield_steel", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a steel shield because ...
         descname = _"forging a steel shield",
         actions = {
            "return=skipped unless economy needs shield_steel",
            "consume=iron:2",
            "sleep=duration:32s",
            "animate=working duration:35s",
            "produce=shield_steel"
         }
      })
D:modify_unit("productionsite", "atlanteans_armorsmithy", "programs", "set", "produce_shield_advanced", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced shield because ...
         descname = _"forging an advanced shield",
         actions = {
            "return=skipped unless economy needs shield_advanced",
            "consume=iron coal gold:4",
            "sleep=duration:32s",
            "animate=working duration:45s",
            "produce=shield_advanced"
         }
      })
D:modify_unit("productionsite", "atlanteans_armorsmithy", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_shield_steel",
            "call=produce_shield_advanced",
         }
      })

D:modify_unit("productionsite", "atlanteans_weaponsmithy", "input", "modify_ware", "planks", 3)
D:modify_unit("productionsite", "atlanteans_weaponsmithy", "input", "modify_ware", "coal", 6)
D:modify_unit("productionsite", "atlanteans_weaponsmithy", "input", "modify_ware", "iron", 7)
D:modify_unit("productionsite", "atlanteans_weaponsmithy", "input", "modify_ware", "gold", 5)
D:modify_unit("productionsite", "atlanteans_weaponsmithy", "programs", "set", "produce_trident_light", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a light trident because ...
         descname = _"forging a light trident",
         actions = {
            "return=skipped unless economy needs trident_light",
            "consume=iron planks",
            "sleep=duration:20s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:21s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=trident_light"
         }
      })
D:modify_unit("productionsite", "atlanteans_weaponsmithy", "programs", "set", "produce_trident_long", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a long trident because ...
         descname = _"forging a long trident",
         actions = {
            "return=skipped unless economy needs trident_long",
            "consume=coal",
            "sleep=duration:32s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:36s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=trident_long"
         }
      })
D:modify_unit("productionsite", "atlanteans_weaponsmithy", "programs", "set", "produce_trident_steel", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a steel trident because ...
         descname = _"forging a steel trident",
         actions = {
            "return=skipped unless economy needs trident_steel",
            "consume=iron coal:2",
            "sleep=duration:32s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:36s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=trident_steel"
         }
      })
D:modify_unit("productionsite", "atlanteans_weaponsmithy", "programs", "set", "produce_trident_double", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a double trident because ...
         descname = _"forging a double trident",
         actions = {
            "return=skipped unless economy needs trident_double",
            "consume=iron:2 coal:2 planks gold",
            "sleep=duration:32s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:36s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=trident_double"
         }
      })
D:modify_unit("productionsite", "atlanteans_weaponsmithy", "programs", "set", "produce_trident_heavy_double", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a heavy double trident because ...
         descname = _"forging a heavy double trident",
         actions = {
            "return=skipped unless economy needs trident_heavy_double",
            "consume=iron:3 coal planks:2 gold:4",
            "sleep=duration:32s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:36s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=trident_heavy_double"
         }
      })
D:modify_unit("productionsite", "atlanteans_weaponsmithy", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_trident_light",
            "call=produce_trident_long",
            "call=produce_trident_steel",
            "call=produce_trident_double",
            "call=produce_trident_heavy_double",
         }
      })

D:modify_unit("productionsite", "atlanteans_toolsmithy", "input", "modify_ware", "spidercloth", 2)
D:modify_unit("productionsite", "atlanteans_toolsmithy", "input", "modify_ware", "iron", 2)
D:modify_unit("productionsite", "atlanteans_toolsmithy", "input", "modify_ware", "log", 3)
D:modify_unit("productionsite", "atlanteans_toolsmithy", "programs", "set", "produce_saw", {
         -- TRANSLATORS: Completed/Skipped/Did not start making a saw because ...
         descname = _"making a saw",
         actions = {
            "return=skipped unless economy needs saw",
            "consume=iron:2 log:3",
            "sleep=duration:32s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s",
            "produce=saw"
         }
      })
D:modify_unit("productionsite", "atlanteans_toolsmithy", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_fire_tongs",
            "call=produce_hunting_bow",
            "call=produce_pick",
            "call=produce_hammer",
            "call=produce_saw",
            "call=produce_shovel",
            "call=produce_scythe",
            "call=produce_bread_paddle",
            "call=produce_hook_pole",
            "call=produce_buckets",
            "call=produce_milking_tongs",
            "call=produce_fishing_net",
         }
      })

D:modify_unit("productionsite", "atlanteans_smelting_works", "input", "modify_ware", "coal", 3)
D:modify_unit("productionsite", "atlanteans_smelting_works", "input", "modify_ware", "iron_ore", 3)
D:modify_unit("productionsite", "atlanteans_smelting_works", "input", "modify_ware", "gold_ore", 10)
D:modify_unit("productionsite", "atlanteans_smelting_works", "programs", "set", "smelt_iron", {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
         descname = _"smelting iron",
         actions = {
            "return=skipped unless economy needs iron",
            "consume=iron_ore coal",
            "sleep=duration:25s",
            "playsound=sound/metal/fizzle priority:15% allow_multiple",
            "animate=working duration:35s",
            "playsound=sound/metal/ironping priority:60%",
            "produce=iron:2"
         }
      })
D:modify_unit("productionsite", "atlanteans_smelting_works", "programs", "set", "smelt_iron_2", {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
         descname = _"smelting iron",
         actions = {
            "return=skipped unless economy needs iron",
            "consume=iron_ore coal",
            "sleep=duration:25s",
            "playsound=sound/metal/fizzle priority:15% allow_multiple",
            "animate=working duration:35s",
            "playsound=sound/metal/ironping priority:60%",
            "produce=iron:2"
         }
      })
D:modify_unit("productionsite", "atlanteans_smelting_works", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=smelt_iron",
            "call=smelt_gold",
            "call=smelt_iron_2",
         }
      })

D:modify_unit("productionsite", "atlanteans_weaving_mill", "input", "modify_ware", "spider_silk", 3)
D:modify_unit("productionsite", "atlanteans_weaving_mill", "input", "modify_ware", "gold_thread", 1)

D:modify_unit("productionsite", "atlanteans_woodcutters_house", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
         descname = _"felling trees",
         actions = {
            "callworker=harvest",
            "sleep=duration:2s"
         }
      })

D:modify_unit("productionsite", "atlanteans_sawmill", "input", "modify_ware", "log", 3)
D:modify_unit("productionsite", "atlanteans_sawmill", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start sawing logs because ...
         descname = _"sawing logs",
         actions = {
            "return=skipped unless economy needs planks",
            "consume=log",
            "sleep=duration:16s500ms",
            "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
            "animate=working duration:20s",
            "produce=planks"
         }
      })

D:modify_unit("productionsite", "atlanteans_coalmine", "input", "modify_ware", "atlanteans_bread", 4)
D:modify_unit("productionsite", "atlanteans_coalmine", "input", "modify_ware", "smoked_fish", 4)
D:modify_unit("productionsite", "atlanteans_coalmine", "input", "modify_ware", "smoked_meat", 12)

D:modify_unit("productionsite", "atlanteans_ironmine", "input", "modify_ware", "atlanteans_bread", 4)
D:modify_unit("productionsite", "atlanteans_ironmine", "input", "modify_ware", "smoked_fish", 4)
D:modify_unit("productionsite", "atlanteans_ironmine", "input", "modify_ware", "smoked_meat", 12)

D:modify_unit("productionsite", "atlanteans_goldmine", "input", "modify_ware", "atlanteans_bread", 2)
D:modify_unit("productionsite", "atlanteans_goldmine", "input", "modify_ware", "smoked_fish", 2)
D:modify_unit("productionsite", "atlanteans_goldmine", "input", "modify_ware", "smoked_meat", 8)

D:modify_unit("productionsite", "atlanteans_gold_spinning_mill", "input", "modify_ware", "gold", 7)
D:modify_unit("productionsite", "atlanteans_gold_spinning_mill", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start spinning gold because ...
         descname = _"spinning gold",
         actions = {
            "return=skipped unless economy needs gold_thread",
            "consume=gold:6",
            "sleep=duration:15s",
            "playsound=sound/atlanteans/goldspin priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=gold_thread"
         }
      })

D:modify_unit("productionsite", "atlanteans_bakery", "input", "modify_ware", "water", 4)
D:modify_unit("productionsite", "atlanteans_bakery", "input", "modify_ware", "cornmeal", 3)
D:modify_unit("productionsite", "atlanteans_bakery", "input", "modify_ware", "blackroot_flour", 3)
D:modify_unit("productionsite", "atlanteans_bakery", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start baking bread because ...
         descname = pgettext("atlanteans_building", "baking bread"),
         actions = {
            "return=skipped unless economy needs atlanteans_bread",
            "consume=water:2 blackroot_flour cornmeal",
            "animate=working duration:35s",
            "sleep=duration:30s",
            "produce=atlanteans_bread:3"
         }
      })

D:modify_unit("productionsite", "atlanteans_farm", "programs", "set", "plant", {
         -- TRANSLATORS: Completed/Skipped/Did not start planting corn because ...
         descname = _"planting corn",
         actions = {
            "callworker=plant",
            "sleep=duration:1s"
         }
      })
D:modify_unit("productionsite", "atlanteans_farm", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=plant",
            "call=harvest",
         }
      })

D:modify_unit("productionsite", "atlanteans_blackroot_farm", "programs", "set", "plant", {
         -- TRANSLATORS: Completed/Skipped/Did not start planting blackroot because ...
         descname = _"planting blackroot",
         actions = {
            "callworker=plant",
            "sleep=duration:1s"
         }
      })
D:modify_unit("productionsite", "atlanteans_blackroot_farm", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=plant",
            "call=harvest",
         }
      })
