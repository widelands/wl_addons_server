push_textdomain("europeans_all.wad", true)

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
        prohibited_till = 900,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        amazons_gold_smelter = 1,
        barbarians_smelter = 1
    },

    inputs = {
        { name = "coal", amount = 8 },
        { name = "iron_ore", amount = 4 },
        { name = "gold_dust", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=smelting_gold_dust",
                "call=smelting_iron_ore",
                "return=skipped"
            }
        },
        smelting_gold_dust = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
            descname = _("smelting gold"),
            actions = {
                -- time total: 30.4 + 42 + 3.6 = 76 sec
                "return=skipped unless economy needs gold",
                "consume=coal gold_dust",
                "sleep=duration:30s400ms",
                "playsound=sound/metal/furnace priority:50% allow_multiple",
                "animate=working duration:42s",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold"
            },
        },
        smelting_iron_ore = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting ore because ...
            descname = pgettext("europeans_building", "smelting ore"),
            actions = {
                -- time: 29.4 + 35 + 3.6 = 68 sec
                "return=skipped unless economy needs iron",
                "consume=coal iron_ore",
                "sleep=duration:29s400ms",
                "playsound=sound/metal/furnace priority:50% allow_multiple",
                "animate=working duration:35s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron"
            }
        },
    },
}

pop_textdomain()
