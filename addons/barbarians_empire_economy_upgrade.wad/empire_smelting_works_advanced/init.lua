push_textdomain("barbarians_empire_economy_upgrade.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "empire_smelting_works_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("empire_building", "Advanced Smelting Works"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 48, 60 },
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 48, 60 },
      },
      working = {
         fps = 5,
         frames = 20,
         columns = 10,
         rows = 2,
         hotspot = { 48, 60 },
      },
    },
    
    size = "medium",

    buildcost = {
        log = 1,
        granite = 4,
        marble = 2,
        marble_column = 1,
        planks = 2
    },
    return_on_dismantle = {
        granite = 3,
        marble = 2,
        planks = 1
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        empire_smelter = 2,
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
            descname = pgettext("empire_building", "smelting iron"),
            actions = {
                "return=skipped unless economy needs iron",
                "consume=iron_ore:2 coal:1",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron",
                "sleep=duration:6s",
            }
        },
        smelting_2gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
            descname = pgettext("empire_building", "smelting gold"),
            actions = {
                "return=skipped unless economy needs gold",
                "consume=gold_ore:2 coal:1",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:1m",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:1m",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold",
                "sleep=duration:6s"
            }
        },
        smelting_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
            descname = pgettext("empire_building", "smelting gold"),
            actions = {
                "return=skipped when site has gold_ore:2",
                "return=skipped unless economy needs gold",
                "consume=gold_ore:1 coal:1",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working duration:1m",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold",
                "sleep=duration:4s"
            }
        },
        smelting_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
            descname = pgettext("empire_building", "smelting iron"),
            actions = {
                "return=skipped when site has iron_ore:2",
                "return=skipped unless economy needs iron",
                "consume=iron_ore:1 coal:1",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working duration:1m",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron",
                "sleep=duration:4s"
            }
        }
    },
}

pop_textdomain()
