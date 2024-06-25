push_textdomain("barbarians_empire_economy_upgrade.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "barbarians_smelting_works",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("barbarians_building", "Smelting Works"),
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
    },
    
    size = "medium",
    enhancement = {
        name = "barbarians_smelting_works_advanced",
        enhancement_cost = {
            reed = 1,
            granite = 1,
            blackwood = 1,
            grout = 1
        },
        enhancement_return_on_dismantle = {
            reed = 1,
            grout = 1
        },
    },

    buildcost = {
        log = 3,
        reed = 2,
        granite = 1,
        blackwood = 1,
        grout = 1
    },
    return_on_dismantle = {
        log = 1,
        granite = 1,
        blackwood = 1
    },

    aihints = {
        very_weak_ai_limit = 2,
        weak_ai_limit = 1,
        normal_ai_limit = 0,
    },

    working_positions = {
        barbarians_smelter = 1
    },

    inputs = {
        { name = "coal", amount = 8 },
        { name = "iron_ore", amount = 8 },
        { name = "gold_ore", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=smelting_iron",
                "call=smelting_iron",
                "call=smelting_gold",
                "return=skipped"
            }
        },
        smelting_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
            descname = pgettext("barbarians_building", "smelting gold"),
            actions = {
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
