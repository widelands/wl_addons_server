push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/furnace/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_smelting_works_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Smelting Works Level 4"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {50, 58}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {50, 69},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working_iron = {
            hotspot = {50, 69},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working_gold = {
            hotspot = {50, 69},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_smelting_works_level_5",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            reed = 2
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            grout = 1
        }
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        europeans_worker_basic = 1,
        europeans_worker_advanced = 2
    },

    inputs = {
        { name = "coal", amount = 20 },
        { name = "ore", amount = 20 }
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
                "consume=ore:10 coal:10",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working_gold duration:2m",
                "playsound=sound/metal/ironping priority:60%",
                "produce=gold:5",
                "animate=working_gold duration:2m",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold:5"
            }
        }
    },
}

pop_textdomain()
