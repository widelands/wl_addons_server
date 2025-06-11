push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/tavern/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_tavern_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Tavern Level 2"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 46, 55 },
        },
        working = {
            basename = "idle",
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 46, 55 },
        },
    },

    size = "medium",
    enhancement = {
        name = "europeans_tavern_level_3",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            reed = 1
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            grout = 1
        }
    },

    aihints = {
        prohibited_till = 4200,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        empire_innkeeper = 1
    },

    inputs = {
        { name = "fish", amount = 4 },
        { name = "meat", amount = 4 },
        { name = "empire_bread", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=produce_empire_ration",
            }
        },
        produce_empire_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = _("preparing a ration"),
            actions = {
                -- time total: 23.4 + 10 + 3.6 = 37 sec
                "return=skipped unless economy needs ration",
                "consume=empire_bread fish,meat",
                "playsound=sound/empire/taverns/ration priority:80%",
                "animate=working duration:23s400ms",
                "sleep=duration:10s",
                "produce=ration"
            },
        },
    },
}

pop_textdomain()
