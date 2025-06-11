push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/inn/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_inn_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Inn Level 2"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 46, 74 },
        },
        working = {
            basename = "idle",
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 46, 74 },
        },
    },

    size = "medium",
    enhancement = {
        name = "europeans_inn_level_3",
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
        prohibited_till = 4200,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        empire_innkeeper = 2
    },

    inputs = {
        { name = "smoked_fish", amount = 8 },
        { name = "smoked_meat", amount = 8 },
        { name = "fruit", amount = 8 },
        { name = "empire_bread", amount = 8 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=produce_empire_meal",
                "call=produce_empire_snack",
                "call=produce_empire_ration",
            }
        },
        produce_empire_meal = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a meal because ...
            descname = _("preparing a meal"),
            actions = {
                -- time: 30.4 + 10 + 3.6 = 44 sec
                "return=skipped unless economy needs meal",
                "consume=empire_bread:2 smoked_fish smoked_meat fruit",
                "playsound=sound/empire/taverns/meal priority:80%",
                "animate=working duration:30s400ms",
                "sleep=duration:10s",
                "produce=meal"
            }
        },
        produce_empire_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = _("preparing a ration"),
            actions = {
                -- time total: 23.4 + 10 + 3.6 = 37 sec
                "return=skipped unless economy needs ration",
                "consume=empire_bread fruit,smoked_fish,smoked_meat",
                "playsound=sound/empire/taverns/ration priority:80%",
                "animate=working duration:23s400ms",
                "sleep=duration:10s",
                "produce=ration"
            },
        },
        produce_empire_snack = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack because ...
            descname = _("preparing a snack"),
            actions = {
                -- time: 27.4 + 10 + 3.6 = 41 sec
                "return=skipped unless economy needs snack",
                "consume=empire_bread fruit,smoked_fish fruit,smoked_meat",
                "playsound=sound/empire/taverns/meal priority:80%",
                "animate=working duration:27s400ms",
                "sleep=duration:10s",
                "produce=snack"
            }
        },
    },
}

pop_textdomain()
