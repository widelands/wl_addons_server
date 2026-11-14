push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/amazons/rope_weaver_booth/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_weaving_mill_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Weaving Mill Level 1"),
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
    
    size = "big",
    enhancement = {
        name = "europeans_weaving_mill_level_2",
        enhancement_cost = {
            planks = 3,
            granite = 3
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2
        }
    },

    aihints = {
        supports_seafaring = true,
        prohibited_till = 600,
        basic_amount = 1,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        amazons_liana_cutter = 2
    },

    inputs = {
        { name = "cotton", amount = 6 },
        { name = "liana", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_rope",
                "sleep=duration:30s",
                "call=produce_cloth",
                "return=skipped"
            }
        },
        produce_cloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = pgettext("europeans_building", "weaving cloth"),
            actions = {
                "return=skipped unless economy needs cloth or workers need experience",
                "consume=cotton:3",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:3m",
                "produce=cloth:2"
            }
        },
        produce_rope = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving rope because ...
            descname = pgettext("europeans_building", "weaving rope"),
            actions = {
                "return=skipped unless economy needs rope or workers need experience",
                "consume=liana:3",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:3m",
                "produce=rope:2"
            }
        },
    },
}

pop_textdomain()
