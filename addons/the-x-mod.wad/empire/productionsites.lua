----------------------------------------------------------------------------------------------
--                         Empire productionsites
----------------------------------------------------------------------------------------------

if N then
D:modify_unit("building", "empire_farm", "buildcost", "remove", "marble_column")
D:modify_unit("building", "empire_farm", "buildcost", "remove", "granite")
D:modify_unit("building", "empire_farm", "buildcost", "remove", "planks")
D:modify_unit("building", "empire_farm", "buildcost", "set", "marble", 7)
D:modify_unit("building", "empire_farm", "return_on_dismantle", "remove", "marble_column")
D:modify_unit("building", "empire_farm", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "empire_farm", "return_on_dismantle", "remove", "planks")
D:modify_unit("building", "empire_farm", "return_on_dismantle", "set", "marble", 2)

D:modify_unit("building", "empire_sheepfarm", "buildcost", "set", "log", 12)
D:modify_unit("building", "empire_sheepfarm", "buildcost", "set", "planks", 12)
D:modify_unit("building", "empire_sheepfarm", "buildcost", "set", "granite", 12)
D:modify_unit("building", "empire_sheepfarm", "return_on_dismantle", "set", "log", 4)
D:modify_unit("building", "empire_sheepfarm", "return_on_dismantle", "set", "planks", 4)
D:modify_unit("building", "empire_sheepfarm", "return_on_dismantle", "set", "granite", 4)

D:modify_unit("building", "empire_mill", "buildcost", "set", "log", 12)
D:modify_unit("building", "empire_mill", "buildcost", "set", "granite", 12)
D:modify_unit("building", "empire_mill", "buildcost", "set", "marble", 9)
D:modify_unit("building", "empire_mill", "return_on_dismantle", "set", "log", 4)
D:modify_unit("building", "empire_mill", "return_on_dismantle", "set", "granite", 4)
D:modify_unit("building", "empire_mill", "return_on_dismantle", "set", "marble", 2)

D:modify_unit("building", "empire_armorsmithy", "buildcost", "remove", "marble")
D:modify_unit("building", "empire_armorsmithy", "buildcost", "remove", "granite")
D:modify_unit("building", "empire_armorsmithy", "buildcost", "remove", "log")
D:modify_unit("building", "empire_armorsmithy", "return_on_dismantle", "remove", "marble")
D:modify_unit("building", "empire_armorsmithy", "return_on_dismantle", "remove", "granite")

D:modify_unit("building", "empire_weaponsmithy", "buildcost", "remove", "marble_column")
D:modify_unit("building", "empire_weaponsmithy", "buildcost", "remove", "marble")
D:modify_unit("building", "empire_weaponsmithy", "buildcost", "set", "granite", 1)
D:modify_unit("building", "empire_weaponsmithy", "return_on_dismantle", "remove", "marble_column")
D:modify_unit("building", "empire_weaponsmithy", "return_on_dismantle", "remove", "marble")

D:modify_unit("building", "empire_piggery", "buildcost", "set", "log", 12)
D:modify_unit("building", "empire_piggery", "buildcost", "set", "granite", 12)
D:modify_unit("building", "empire_piggery", "buildcost", "set", "marble_column", 12)
D:modify_unit("building", "empire_piggery", "return_on_dismantle", "set", "log", 4)
D:modify_unit("building", "empire_piggery", "return_on_dismantle", "set", "granite", 4)
D:modify_unit("building", "empire_piggery", "return_on_dismantle", "set", "marble_column", 4)
end -- if N

D:modify_unit("productionsite", "empire_piggery", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
         descname = _"raising pigs",
         actions = {
            "return=skipped unless economy needs meat",
            "consume=water wheat",
            "sleep=duration:80s",
            "playsound=sound/farm/farm_animal priority:40% allow_multiple",
            "animate=working duration:20s",
            "produce=meat"
         }
      })

D:modify_unit("productionsite", "empire_scouts_house", "input", "modify_ware", "ration", 25)
D:modify_unit("productionsite", "empire_scouts_house", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start scouting because ...
         descname = _"scouting",
         actions = {
            "consume=ration:25",
            "sleep=duration:30s",
            "callworker=scout"
         }
      })
D:modify_unit("productionsite", "empire_scouts_house", "programs", "set", "targeted_scouting", {
         descname = _"scouting",
         actions = {
            "consume=ration:25",
            "callworker=targeted_scouting"
         }
      })

D:modify_unit("productionsite", "empire_stonemasons_house", "input", "modify_ware", "marble", 7)
D:modify_unit("productionsite", "empire_stonemasons_house", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start sculpting a marble column because ...
         descname = _"sculpting a marble column",
         actions = {
            "return=skipped unless economy needs marble_column",
            "consume=marble:3",
            "sleep=duration:50s",
            "playsound=sound/stonecutting/stonemason priority:50% allow_multiple",
            "animate=working duration:32s",
            "produce=marble_column:3"
         }
      })

D:modify_unit("productionsite", "empire_sawmill", "input", "modify_ware", "log", 2)
D:modify_unit("productionsite", "empire_sawmill", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start sawing logs because ...
         descname = _"sawing logs",
         actions = {
            "return=skipped unless economy needs planks",
            "consume=log",
            "sleep=duration:16s500ms",
            "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
            "animate=working duration:20s",
            "produce=planks"
         }
      })

D:modify_unit("productionsite", "empire_inn", "programs", "set", "produce_meal", {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a meal because ...
         descname = _"preparing a meal",
         actions = {
            "return=skipped unless economy needs meal",
            "consume=empire_bread,fish,meat:3",
            "playsound=sound/empire/taverns/meal priority:80%",
            "animate=working duration:30s",
            "sleep=duration:10s",
            "produce=meal"
         }
      })
D:modify_unit("productionsite", "empire_inn", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_ration",
            "call=produce_meal",
         }
      })

D:modify_unit("productionsite", "empire_armorsmithy", "programs", "set", "produce_armor_helmet", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a helmet because ...
         descname = _"forging a helmet",
         actions = {
            "return=skipped unless economy needs armor_helmet",
            "consume=iron coal",
            "sleep=duration:47s",
            "animate=working duration:20s",
            "produce=armor_helmet"
         }
      })
D:modify_unit("productionsite", "empire_armorsmithy", "programs", "set", "produce_armor", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of armor because ...
         descname = _"forging a suit of armor",
         actions = {
            "return=skipped unless economy needs armor",
            "consume=iron:2 coal",
            "sleep=duration:32s",
            "animate=working duration:45s",
            "produce=armor"
         }
      })
D:modify_unit("productionsite", "empire_armorsmithy", "programs", "set", "produce_armor_chain", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of chain armor because ...
         descname = _"forging a suit of chain armor",
         actions = {
            "return=skipped unless economy needs armor_chain",
            "consume=iron coal:3 cloth",
            "sleep=duration:32s",
            "animate=working duration:45s",
            "produce=armor_chain"
         }
      })
D:modify_unit("productionsite", "empire_armorsmithy", "programs", "set", "produce_armor_gilded", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of gilded armor because ...
         descname = _"forging a suit of gilded armor",
         actions = {
            "return=skipped unless economy needs armor_gilded",
            "consume=iron:2 coal:2 cloth gold:4",
            "sleep=duration:32s",
            "animate=working duration:45s",
            "produce=armor_gilded"
         }
      })
D:modify_unit("productionsite", "empire_armorsmithy", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_armor_helmet",
            "call=produce_armor",
            "call=produce_armor_chain",
            "call=produce_armor_helmet",
            "call=produce_armor_gilded",
         }
      })

D:modify_unit("productionsite", "empire_weaponsmithy", "programs", "set", "produce_spear_wooden", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a wooden spear because ...
         descname = _"forging a wooden spear",
         actions = {
            "return=skipped unless economy needs spear_wooden",
            "consume=planks",
            "sleep=duration:20s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:21s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=spear_wooden"
         }
      })
D:modify_unit("productionsite", "empire_weaponsmithy", "programs", "set", "produce_spear", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a spear because ...
         descname = _"forging a spear",
         actions = {
            "return=skipped unless economy needs spear",
            "consume=coal planks",
            "sleep=duration:32s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:36s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=spear"
         }
      })
D:modify_unit("productionsite", "empire_weaponsmithy", "programs", "set", "produce_spear_advanced", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
         descname = _"forging an advanced spear",
         actions = {
            "return=skipped unless economy needs spear_advanced",
            "consume=coal iron",
            "sleep=duration:32s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:36s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=spear_advanced"
         }
      })
D:modify_unit("productionsite", "empire_weaponsmithy", "programs", "set", "produce_spear_heavy", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a heavy spear because ...
         descname = _"forging a heavy spear",
         actions = {
            "return=skipped unless economy needs spear_heavy",
            "consume=coal gold iron:2",
            "sleep=duration:32s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:36s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=spear_heavy"
         }
      })
D:modify_unit("productionsite", "empire_weaponsmithy", "programs", "set", "produce_spear_war", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a war spear because ...
         descname = _"forging a war spear",
         actions = {
            "return=skipped unless economy needs spear_war",
            "consume=coal:2 gold:4 iron:3 planks",
            "sleep=duration:32s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:36s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=spear_war"
         }
      })
D:modify_unit("productionsite", "empire_weaponsmithy", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_spear_wooden",
            "call=produce_spear",
            "call=produce_spear_advanced",
            "call=produce_spear_heavy",
            "call=produce_spear_war",
         }
      })

D:modify_unit("productionsite", "empire_marblemine", "programs", "set", "a_mine_produce_granite", {
         descname = _"mining granite",
         actions = {
            "animate=working duration:10s500ms",
            "mine=resource_stones radius:2 yield:50% when_empty:5% experience_on_fail:17%",
            "produce=granite",
         }
      })
D:modify_unit("productionsite", "empire_marblemine", "programs", "set", "a_mine_produce_marble", {
         descname = _"mining marble",
         actions = {
            "animate=working duration:10s500ms",
            "mine=resource_stones radius:2 yield:50% when_empty:5% experience_on_fail:17%",
            "produce=marble:3",
         }
      })
D:modify_unit("productionsite", "empire_marblemine", "programs", "set", "mine_granite", {
         -- TRANSLATORS: Completed/Skipped/Did not start mining granite because ...
         descname = _"mining granite",
         actions = {
            "return=skipped unless economy needs marble or economy needs granite",
            "consume=ration wine",
            "sleep=duration:18s",
            "call=a_mine_produce_granite",
            "call=a_mine_produce_granite",
            "call=a_mine_produce_marble",
            "call=a_mine_produce_granite",
         }
      })
D:modify_unit("productionsite", "empire_marblemine", "programs", "set", "mine_marble", {
         -- TRANSLATORS: Completed/Skipped/Did not start mining marble because ...
         descname = _"mining marble",
         actions = {
            "return=skipped unless economy needs marble or economy needs granite",
            "consume=wine ration",
            "sleep=duration:18s",
            "call=a_mine_produce_marble",
            "call=a_mine_produce_marble",
            "call=a_mine_produce_granite",
            "call=a_mine_produce_marble",
         }
      })
D:modify_unit("productionsite", "empire_marblemine", "programs", "set", "encyclopedia_granite", {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=ration wine",
            "produce=granite marble:3",
         }
      })
D:modify_unit("productionsite", "empire_marblemine", "programs", "set", "encyclopedia_marble", {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=wine ration",
            "produce=marble:6 granite",
         }
      })
D:modify_unit("productionsite", "empire_marblemine", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=mine_granite",
            "call=mine_marble",
         }
      })

D:modify_unit("productionsite", "empire_coalmine", "input", "modify_ware", "ration", 5)
D:modify_unit("productionsite", "empire_coalmine", "input", "remove_ware", "beer")
D:modify_unit("productionsite", "empire_coalmine", "programs", "set", "mine_produce", {
         descname = _"mining coal",
         actions = {
            "animate=working duration:14s",
            "mine=resource_coal radius:2 yield:50% when_empty:5% experience_on_fail:17%",
            "produce=coal",
         }
      })
D:modify_unit("productionsite", "empire_coalmine", "programs", "set", "encyclopedia", {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=ration",
            "produce=coal",
         }
      })
D:modify_unit("productionsite", "empire_coalmine", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
         descname = _"mining coal",
         actions = {
            "return=skipped unless economy needs coal",
            "consume=ration",
            "sleep=duration:43s",
            "call=mine_produce",
            "call=mine_produce",
            "call=mine_produce",
         }
      })
