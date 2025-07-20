push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/brick_kiln/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_stonemasons_house_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Brick Kiln"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {50, 58}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {50, 72},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working = {
            hotspot = {50, 75},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_stonemasons_house_level_2",
        enhancement_cost = {
            brick = 3,
            marble = 3
        },
        enhancement_return_on_dismantle = {
            brick = 2,
            marble = 2,
        },
    },

    aihints = {
        prohibited_till = 600,
        basic_amount = 1,
        very_weak_ai_limit = 2,
        weak_ai_limit = 3
    },

    working_positions = {
        barbarians_lime_burner = 1,
        frisians_brickmaker = 1
    },

    inputs = {
        { name = "granite", amount = 8 },
        { name = "water", amount = 6 },
        { name = "clay", amount = 6 },
        { name = "coal", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=mixing_grout",
                "sleep=duration:30s",
                "call=burning_bricks",
                "return=skipped"
            }
        },
        mixing_grout = {
            -- TRANSLATORS: Completed/Skipped/Did not start mixing grout because ...
            descname = pgettext("europeans_building", "mixing grout"),
            actions = {
                "return=skipped unless economy needs grout",
                "return=skipped when economy needs brick and not economy needs grout",
                "return=skipped when economy needs granite and not economy needs grout",
                "return=skipped when economy needs coal and not economy needs grout",
                "return=skipped when economy needs water and not economy needs grout",
                "consume=coal:3 granite:4",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:2m",
                "consume=water:4",
                "playsound=sound/barbarians/mortar priority:60%",
                "animate=working duration:1m",
                "produce=grout:4"
            }
        },
        burning_bricks = {
            -- TRANSLATORS: Completed/Skipped/Did not start burning bricks because ...
            descname = pgettext("europeans_building", "burning bricks"),
            actions = {
                "return=skipped unless economy needs brick",
                "return=skipped when economy needs grout and not economy needs brick",
                "return=skipped when economy needs granite and not economy needs brick",
                "return=skipped when economy needs coal and not economy needs brick",
                "consume=granite:2 clay:4",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:1m",
                "consume=coal:3",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:2m",
                "produce=brick:4"
            }
        }
    },
}

pop_textdomain()
