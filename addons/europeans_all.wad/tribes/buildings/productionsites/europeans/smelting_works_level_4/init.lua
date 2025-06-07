push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/frisians/furnace/"

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
        prohibited_till = 900,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        amazons_gold_smelter = 1,
        frisians_smelter = 1
    },

    inputs = {
        { name = "coal", amount = 8 },
        { name = "iron_ore", amount = 4 },
        { name = "gold_ore", amount = 4 },
        { name = "gold_dust", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=smelting_gold_dust",
                "call=smelting_gold_ore",
                "call=smelting_iron_ore",
                "return=skipped"
            }
        },
        smelting_gold_dust = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
            descname = _("smelting gold"),
            actions = {
                -- time total: 23.4 + 35 + 3.6 = 62 sec
                "return=skipped unless economy needs gold",
                "consume=coal gold_dust",
                "sleep=duration:23s400ms",
                "playsound=sound/metal/furnace priority:50% allow_multiple",
                "animate=working_gold duration:35s",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold"
            },
        },
        smelting_gold_ore = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
            descname = _("smelting gold"),
            actions = {
                -- time: 25.4 + 35 + 3.6 = 62 sec
                "return=skipped unless economy needs gold",
                "consume=gold_ore coal",
                "sleep=duration:23s400ms",
                "playsound=sound/metal/furnace priority:50% allow_multiple",
                "animate=working_gold duration:35s",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold"
            },
        },
        smelting_iron_ore = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting ore because ...
            descname = pgettext("europeans_building", "smelting ore"),
            actions = {
                -- time: 23.4 + 35 + 3.6 = 62 sec
                "return=skipped unless economy needs iron",
                "consume=iron_ore coal",
                "sleep=duration:23s400ms",
                "playsound=sound/metal/furnace priority:50% allow_multiple",
                "animate=working_iron duration:35s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron"
            }
        },
    },
}

pop_textdomain()
