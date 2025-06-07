push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/inn/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_inn_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Inn"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 57, 88 },
        },
    },
    spritesheets = {
        build = {
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 51, 81 }
        },
        working = {
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 51, 81 }
        },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_inn_level_1",
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
        barbarians_innkeeper = 1,
        amazons_cook = 1
    },

    inputs = {
        { name = "smoked_fish", amount = 8 },
        { name = "smoked_meat", amount = 8 },
        { name = "fruit", amount = 8 },
        { name = "barbarians_bread", amount = 4 },
        { name = "amazons_bread", amount = 4 },
        { name = "atlanteans_bread", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=produce_barbarians_snack",
                "call=produce_barbarians_ration",
                "call=produce_amazons_snack",
                "call=produce_amazons_ration",
                "call=produce_atlanteans_snack",
                "call=produce_atlanteans_ration"
            }
        },
        produce_amazons_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = _("preparing a ration"),
            actions = {
                -- time total: 23.4 + 10 + 3.6 = 37 sec
                "return=skipped unless economy needs ration",
                "consume=amazons_bread fruit,smoked_fish,smoked_meat",
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
                "consume=amazons_bread fruit,smoked_fish fruit,smoked_meat",
                "playsound=sound/barbarians/taverns/inn priority:80%",
                "animate=working duration:27s400ms",
                "sleep=duration:10s",
                "produce=snack"
            }
        },
        produce_atlanteans_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = _("preparing a ration"),
            actions = {
                -- time total: 23.4 + 10 + 3.6 = 37 sec
                "return=skipped unless economy needs ration",
                "consume=atlanteans_bread fruit,smoked_fish,smoked_meat",
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
                "consume=atlanteans_bread fruit,smoked_fish fruit,smoked_meat",
                "playsound=sound/barbarians/taverns/inn priority:80%",
                "animate=working duration:27s400ms",
                "sleep=duration:10s",
                "produce=snack"
            }
        },
        produce_barbarians_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = _("preparing a ration"),
            actions = {
                -- time total: 23.4 + 10 + 3.6 = 37 sec
                "return=skipped unless economy needs ration",
                "consume=barbarians_bread fruit,smoked_fish,smoked_meat",
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
                "consume=barbarians_bread fruit,smoked_fish fruit,smoked_meat",
                "playsound=sound/barbarians/taverns/inn priority:80%",
                "animate=working duration:27s400ms",
                "sleep=duration:10s",
                "produce=snack"
            }
        },
    },
}

pop_textdomain()
