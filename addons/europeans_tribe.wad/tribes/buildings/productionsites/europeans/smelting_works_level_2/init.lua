push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/atlanteans/smelting_works/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_smelting_works_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Smelting Works Level 2"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 62, 76 },
        },
        working = {
            basename = "idle",
            hotspot = { 62, 76 },
        }
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_smelting_works_level_3",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            marble = 1
        }
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        europeans_worker_basic = 2,
        europeans_worker_advanced = 1
    },

    inputs = {
        { name = "coal", amount = 12 },
        { name = "ore", amount = 12 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=smelting_ore",
                "return=skipped"
            }
        },
        smelting_ore = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting ore because ...
            descname = pgettext("europeans_building", "smelting ore"),
            actions = {
                "return=skipped when economy needs coal and not economy needs gold",
                "consume=ore:6 coal:6",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working duration:2m",
                "playsound=sound/metal/ironping priority:60%",
                "produce=gold:3",
                "animate=working duration:2m",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold:3"
            }
        }
    },
}

pop_textdomain()
