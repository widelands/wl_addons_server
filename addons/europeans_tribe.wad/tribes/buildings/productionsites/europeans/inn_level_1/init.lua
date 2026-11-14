push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/big_inn/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_inn_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Inn Level 1"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 57, 88 },
        },
    },
    spritesheets = {
        working = {
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 57, 81 }
        },
        build = {
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 57, 67 }
        }
    },

    size = "medium",
    enhancement = {
        name = "europeans_inn_level_2",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            grout = 1,
            marble = 1
        }
    },

    aihints = {
        prohibited_till = 4200,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        barbarians_baker = 1,
        barbarians_innkeeper = 1,
        atlanteans_baker = 1,
        atlanteans_smoker = 1,
        amazons_cook = 1
    },

    inputs = {
        { name = "water", amount = 12 },
        { name = "flour", amount = 8 },
        { name = "oat_flour", amount = 8 },
        { name = "cornmeal", amount = 8 },
        { name = "blackroot_flour", amount = 8 },
        { name = "fish", amount = 8 },
        { name = "meat", amount = 8 },
        { name = "fruit", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=produce_barbarians_meal",
                "call=produce_barbarians_snack",
                "call=produce_barbarians_ration",
                "call=produce_amazons_snack",
                "call=produce_amazons_snack",
                "call=produce_amazons_ration",
                "call=produce_atlanteans_meal",
                "call=produce_atlanteans_snack",
                "call=produce_atlanteans_ration",
            }
        },
        produce_amazons_meal = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a meal because ...
            descname = _("preparing a meal"),
            actions = {
                -- time: 30.4 + 10 + 3.6 = 44 sec
                "return=skipped unless economy needs meal",
                "consume=water:3 cornmeal:2 fish meat fruit",
                "playsound=sound/barbarians/taverns/biginn priority:80%",
                "animate=working duration:30s400ms",
                "sleep=duration:10s",
                "produce=meal"
            }
        },
        produce_amazons_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = _("preparing a ration"),
            actions = {
                -- time total: 23.4 + 10 + 3.6 = 37 sec
                "return=skipped unless economy needs ration",
                "consume=water:2 cornmeal fruit,fish,meat",
                "playsound=sound/barbarians/taverns/tavern priority:80%",
                "animate=working duration:23s400ms",
                "sleep=duration:10s",
                "produce=ration"
            },
        },
        produce_amazons_snack = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack because ...
            descname = _("preparing a snack"),
            actions = {
                -- time: 27.4 + 10 + 3.6 = 41 sec
                "return=skipped unless economy needs snack",
                "consume=water:2 cornmeal:2 fruit,fish fruit,meat",
                "playsound=sound/barbarians/taverns/inn priority:80%",
                "animate=working duration:27s400ms",
                "sleep=duration:10s",
                "produce=snack"
            }
        },
        produce_atlanteans_meal = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a meal because ...
            descname = _("preparing a meal"),
            actions = {
                -- time: 30.4 + 10 + 3.6 = 44 sec
                "return=skipped unless economy needs meal",
                "consume=water:3 cornmeal blackroot_flour fish meat fruit",
                "playsound=sound/barbarians/taverns/biginn priority:80%",
                "animate=working duration:30s400ms",
                "sleep=duration:10s",
                "produce=meal"
            }
        },
        produce_atlanteans_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = _("preparing a ration"),
            actions = {
                -- time total: 23.4 + 10 + 3.6 = 37 sec
                "return=skipped unless economy needs ration",
                "consume=water:2 cornmeal blackroot_flour fruit,fish,meat",
                "playsound=sound/barbarians/taverns/tavern priority:80%",
                "animate=working duration:23s400ms",
                "sleep=duration:10s",
                "produce=ration"
            },
        },
        produce_atlanteans_snack = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack because ...
            descname = _("preparing a snack"),
            actions = {
                -- time: 27.4 + 10 + 3.6 = 41 sec
                "return=skipped unless economy needs snack",
                "consume=water:2 cornmeal blackroot_flour fruit,fish fruit,meat",
                "playsound=sound/barbarians/taverns/inn priority:80%",
                "animate=working duration:27s400ms",
                "sleep=duration:10s",
                "produce=snack"
            }
        },
        produce_barbarians_meal = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a meal because ...
            descname = _("preparing a meal"),
            actions = {
                -- time: 30.4 + 10 + 3.6 = 44 sec
                "return=skipped unless economy needs meal",
                "consume=water:3 flour:2 oat_flour:2 fish meat fruit",
                "playsound=sound/barbarians/taverns/biginn priority:80%",
                "animate=working duration:30s400ms",
                "sleep=duration:10s",
                "produce=meal"
            }
        },
        produce_barbarians_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = _("preparing a ration"),
            actions = {
                -- time total: 23.4 + 10 + 3.6 = 37 sec
                "return=skipped unless economy needs ration",
                "consume=water:2 flour oat_flour fruit,fish,meat",
                "playsound=sound/barbarians/taverns/tavern priority:80%",
                "animate=working duration:23s400ms",
                "sleep=duration:10s",
                "produce=ration"
            },
        },
        produce_barbarians_snack = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack because ...
            descname = _("preparing a snack"),
            actions = {
                -- time: 27.4 + 10 + 3.6 = 41 sec
                "return=skipped unless economy needs snack",
                "consume=water:2 flour oat_flour fruit,fish fruit,meat",
                "playsound=sound/barbarians/taverns/inn priority:80%",
                "animate=working duration:27s400ms",
                "sleep=duration:10s",
                "produce=snack"
            }
        },
    },
}

pop_textdomain()
