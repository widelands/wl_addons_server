push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/amazons/cassava_root_cooker/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_bakery_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Bakery Level 1"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {hotspot = {43, 44}},
        unoccupied = {hotspot = {43, 44}},
    },
    spritesheets = {
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
        name = "europeans_bakery_level_2",
        enhancement_cost = {
            granite = 2,
            planks = 2,
            spidercloth = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1,
            spidercloth = 1
        }
    },

    aihints = {
        prohibited_till = 3600,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        amazons_cook = 1,
        barbarians_baker = 1
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "wheat", amount = 4 },
        { name = "cassavaroot", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_amazons_bread",
                "call=produce_barbarians_bread",
                "return=skipped"
            }
        },
        produce_amazons_bread = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
                descname = pgettext("europeans_building", "Baking amazons bread"),
            actions = {
                -- time total: 5.4 + 18 + 10 + 3.6 = 37 sec
                "return=skipped unless economy needs amazons_bread",
                "consume=cassavaroot water:2",
                "sleep=duration:5s400ms",
                "animate=working duration:18s",
                "sleep=duration:10s",
                "produce=amazons_bread"
            }
        },
        produce_barbarians_bread = {
                -- TRANSLATORS: Completed/Skipped/Did not start Baking bread because ...
                descname = pgettext("europeans_building", "Baking barbarians bread"),
                actions = {
                -- time total: 20.8 + 2 * (20 + 3.6) = 68 sec
                "return=skipped unless economy needs barbarians_bread",
                "consume=water:3 wheat:3",
                "sleep=duration:20s800ms",
                "animate=working duration:20s",
                "produce=barbarians_bread",
                "animate=working duration:20s",
                "produce=barbarians_bread"
            }
        },
    },
}

pop_textdomain()
