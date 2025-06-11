push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/amazons/food_preserver/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_tavern_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Tavern Level 1"),
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
        name = "europeans_tavern_level_2",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            marble = 1
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
        amazons_cook = 1,
        atlanteans_baker = 1
    },

    inputs = {
        { name = "fish", amount = 4 },
        { name = "meat", amount = 4 },
        { name = "amazons_bread", amount = 2 },
        { name = "atlanteans_bread", amount = 2 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=produce_amazons_ration",
                "call=produce_atlanteans_ration",
            }
        },
        produce_amazons_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = _("preparing a ration"),
            actions = {
                -- time total: 23.4 + 10 + 3.6 = 37 sec
                "return=skipped unless economy needs ration",
                "consume=amazons_bread fish,meat",
                "playsound=sound/barbarians/taverns/tavern priority:80%",
                "animate=working duration:23s400ms",
                "sleep=duration:10s",
                "produce=ration"
            },
        },
        produce_atlanteans_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = _("preparing a ration"),
            actions = {
                -- time total: 23.4 + 10 + 3.6 = 37 sec
                "return=skipped unless economy needs ration",
                "consume=atlanteans_bread fish,meat",
                "playsound=sound/barbarians/taverns/tavern priority:80%",
                "animate=working duration:23s400ms",
                "sleep=duration:10s",
                "produce=ration"
            },
        },
    },
}

pop_textdomain()
