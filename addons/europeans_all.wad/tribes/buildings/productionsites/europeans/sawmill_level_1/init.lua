push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/atlanteans/sawmill/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_sawmill_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Sawmill Level 1"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 60, 68 },
        },
    },
    spritesheets = {
        working = {
            fps = 25,
            frames = 19,
            columns = 10,
            rows = 2,
            hotspot = { 60, 68 },
        },
    },

    size = "medium",
    enhancement = {
        name = "europeans_sawmill_level_2",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            grout = 1,
            marble = 1
        },
    },

    aihints = {
        supports_seafaring = true,
        prohibited_till = 600,
        very_weak_ai_limit = 2,
        weak_ai_limit = 3
    },

    working_positions = {
        atlanteans_sawyer = 2
    },

    inputs = {
        { name = "log", amount = 16 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=saw_log",
                "sleep=duration:30s",
                "call=hardening_wood",
                "return=skipped"
            }
        },
        saw_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start sawing logs because ...
            descname = pgettext("europeans_building", "sawing logs"),
            actions = {
                "return=skipped unless economy needs planks or workers need experience",
                "return=skipped when economy needs log and not economy needs planks",
                "return=skipped when economy needs blackwood and not economy needs planks",
                "consume=log:2",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "consume=log:2",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "consume=log:2",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "produce=planks:8",
                "consume=log:2",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "consume=log:2",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "consume=log:2",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "produce=planks:8"
            }
        },
        hardening_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start hardening wood because ...
            descname = pgettext("europeans_building", "hardening wood"),
            actions = {
                "return=skipped unless economy needs blackwood or workers need experience",
                "return=skipped when economy needs log and not economy needs blackwood",
                "return=skipped when economy needs planks and not economy needs blackwood",
                "consume=log:2",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "consume=log:2",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "consume=log:2",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "produce=blackwood:8",
                "consume=log:2",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "consume=log:2",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "consume=log:2",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "produce=blackwood:8"
            }
        }
    },
}

pop_textdomain()
