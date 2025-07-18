push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/recycling_center/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_smelting_works_level_5",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Smelting Works Level 5"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {50, 58}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {50, 70},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working_metal = {
            hotspot = {50, 71}, -- the whole animation is one pixel lower
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working_fur = {
            hotspot = {50, 70},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },
    
    size = "medium",

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        europeans_worker_advanced = 3
    },

    inputs = {
        { name = "coal", amount = 24 },
        { name = "ore", amount = 24 }
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
                "consume=ore:12 coal:12",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working_metal duration:2m",
                "playsound=sound/metal/ironping priority:60%",
                "produce=gold:6",
                "animate=working_metal duration:2m",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold:6"
            }
        }
    },
}

pop_textdomain()
