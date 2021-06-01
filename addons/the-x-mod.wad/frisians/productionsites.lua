----------------------------------------------------------------------------------------------
--                         Frisian productionsites
----------------------------------------------------------------------------------------------

D:modify_unit("productionsite", "frisians_scouts_house", "input", "modify_ware", "ration", 25)
D:modify_unit("productionsite", "frisians_scouts_house", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start scouting because ...
         descname = _"scouting",
         actions = {
            "consume=ration:25",
            "sleep=duration:30s",
            "callworker=scout"
         }
      })
D:modify_unit("productionsite", "frisians_scouts_house", "programs", "set", "targeted_scouting", {
         descname = _"scouting",
         actions = {
            "consume=ration:25",
            "callworker=targeted_scouting"
         }
      })

D:modify_unit("productionsite", "frisians_tailors_shop", "programs", "set", "weave_gold", {
         -- TRANSLATORS: Completed/Skipped/Did not start sewing golden fur garment because ...
         descname = _"sewing golden fur garment",
         actions = {
            "return=skipped unless economy needs fur_garment_golden",
            "consume=fur_garment iron:3 gold:4",
            "sleep=duration:25s",
            "animate=working duration:25s",
            "produce=fur_garment_golden"
         },
      })
D:modify_unit("productionsite", "frisians_tailors_shop", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=weave_studded",
            "call=weave_gold",
            "return=skipped"
         },
      })

D:modify_unit("productionsite", "frisians_armor_smithy_small", "programs", "set", "produce_s2", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a long sword because ...
         descname = _"forging a long sword",
         actions = {
            "return=skipped unless economy needs sword_long",
            "consume=coal iron",
            "sleep=duration:24s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:24s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=sword_long"
         },
      })
D:modify_unit("productionsite", "frisians_armor_smithy_small", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_s1",
            "call=produce_s2",
            "call=produce_h",
            "call=produce_s2",
            "return=skipped"
         },
      })

D:modify_unit("productionsite", "frisians_armor_smithy_large", "input", "modify_ware", "gold", 10)
D:modify_unit("productionsite", "frisians_armor_smithy_large", "programs", "set", "produce_s3", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a broadsword because ...
         descname = _"forging a broadsword",
         actions = {
            "return=skipped unless economy needs sword_broad",
            "consume=coal iron:2",
            "sleep=duration:24s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:24s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=sword_broad"
         },
      })
D:modify_unit("productionsite", "frisians_armor_smithy_large", "programs", "set", "produce_s4", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a double-edged sword because ...
         descname = _"forging a double-edged sword",
         actions = {
            "return=skipped unless economy needs sword_double",
            "consume=coal:2 iron:3",
            "sleep=duration:24s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:24s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=sword_double"
         },
      })
D:modify_unit("productionsite", "frisians_armor_smithy_large", "programs", "set", "produce_hg", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a golden helmet because ...
         descname = _"forging a golden helmet",
         actions = {
            "return=skipped unless economy needs helmet_golden",
            "consume=coal:2 iron:3 gold:4",
            "sleep=duration:30s",
            "animate=working duration:37s",
            "produce=helmet_golden"
         },
      })
D:modify_unit("productionsite", "frisians_armor_smithy_large", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_s3",
            "call=produce_s4",
            "call=produce_hg",
            "call=produce_s3",
            "call=produce_s4",
            "return=skipped"
         },
      })
