push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/amazons/furnace/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_smelting_works_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Smelting Works Level 1"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {unoccupied = {hotspot = {43, 44}}},
    spritesheets = {
        idle = {
            hotspot = {43, 44},
            fps = 4,
            frames = 4,
            columns = 2,
            rows = 2
        },
        working = {
            hotspot = {43, 44},
            fps = 15,
            frames = 30,
            columns = 6,
            rows = 5
        }
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_smelting_works_level_2",
        enhancement_cost = {
            granite = 2,
            planks = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1
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
        { name = "coal", amount = 8 },
        { name = "ore", amount = 8 }
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
                "consume=ore:4 coal:4",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working duration:2m",
                "playsound=sound/metal/ironping priority:60%",
                "produce=gold:2",
                "animate=working duration:2m",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold:2"
            }
        }
    },
}

pop_textdomain()
