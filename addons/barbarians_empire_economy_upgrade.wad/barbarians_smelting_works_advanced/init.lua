push_textdomain("barbarians_empire_economy_upgrade.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "barbarians_smelting_works_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("barbarians_building", "Advanced Smelting Works"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 44, 58 },
      },
      smelting_iron = {
         basename = "smelting_iron",
         hotspot = { 44, 58 },
      },
      smelting_gold = {
         basename = "smelting_gold",
         hotspot = { 44, 58 },
      },
      smelting_2iron = {
         basename = "smelting_2iron",
         hotspot = { 44, 58 },
      },
      smelting_2gold = {
         basename = "smelting_2gold",
         hotspot = { 44, 58 },
      },
    },
    
    size = "medium",

    buildcost = {
        log = 3,
        reed = 3,
        granite = 2,
        blackwood = 2,
        grout = 2
    },
    return_on_dismantle = {
        log = 1,
        reed = 1,
        granite = 1,
        blackwood = 1,
        grout = 1
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        barbarians_smelter = 2
    },

    inputs = {
        { name = "coal", amount = 6 },
        { name = "iron_ore", amount = 6 },
        { name = "gold_ore", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=smelting_iron",
                "call=smelting_2iron",
                "call=smelting_iron",
                "call=smelting_2iron",
                "call=smelting_gold",
                "call=smelting_2gold"
            }
        },
        smelting_2iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
            descname = pgettext("barbarians_building", "smelting iron"),
            actions = {
                "return=skipped unless economy needs iron",
                "consume=iron_ore:2 coal:1",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=smelting_2iron duration:30s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=smelting_2iron duration:30s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron",
                "sleep=duration:15s",
            }
        },
        smelting_2gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
            descname = pgettext("barbarians_building", "smelting gold"),
            actions = {
                "return=skipped unless economy needs gold",
                "consume=gold_ore:2 coal:1",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=smelting_2gold duration:1m",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=smelting_2gold duration:1m",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold",
                "sleep=duration:15s"
            }
        },
        smelting_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
            descname = pgettext("barbarians_building", "smelting gold"),
            actions = {
                "return=skipped when site has gold_ore:2",
                "return=skipped unless economy needs gold",
                "consume=gold_ore:1 coal:1",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=smelting_gold duration:1m",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold",
                "sleep=duration:8s"
            }
        },
        smelting_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
            descname = pgettext("barbarians_building", "smelting iron"),
            actions = {
                "return=skipped when site has iron_ore:2",
                "return=skipped unless economy needs iron",
                "consume=iron_ore:1 coal:1",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=smelting_iron duration:1m",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron",
                "sleep=duration:8s"
            }
        }
    },
}

pop_textdomain()
