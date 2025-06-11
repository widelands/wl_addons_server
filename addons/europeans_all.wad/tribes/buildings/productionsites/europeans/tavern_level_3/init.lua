push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/tavern/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_tavern_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Tavern Level 3"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {50, 58}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {50, 73},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working = {
            hotspot = {50, 73},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },

    size = "medium",
    enhancement = {
        name = "europeans_inn_basic",
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
        prohibited_till = 4200,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        frisians_landlady = 1
    },

    inputs = {
        { name = "fish", amount = 4 },
        { name = "meat", amount = 4 },
        { name = "bread_frisians", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=produce_frisians_ration",
            }
        },
        produce_frisians_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = _("preparing a ration"),
            actions = {
                -- time total: 23.4 + 10 + 3.6 = 37 sec
                "return=skipped unless economy needs ration",
                "consume=bread_frisians fish,meat",
                "playsound=sound/empire/taverns/ration priority:80%",
                "animate=working duration:23s400ms",
                "sleep=duration:10s",
                "produce=ration"
            },
        },
    },
}

pop_textdomain()
