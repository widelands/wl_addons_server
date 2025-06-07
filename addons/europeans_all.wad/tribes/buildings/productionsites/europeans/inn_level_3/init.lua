push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/frisians/drinking_hall/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_inn_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Inn Level 3"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {50, 72}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {50, 82},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working = {
            hotspot = {50, 82},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },

    size = "medium",

    aihints = {
        prohibited_till = 4200,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        frisians_landlady = 2
    },

    inputs = {
        { name = "smoked_fish", amount = 8 },
        { name = "smoked_meat", amount = 8 },
        { name = "fruit", amount = 8 },
        { name = "bread_frisians", amount = 6 },
        { name = "honey_bread", amount = 6 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=produce_frisians_meal",
                "call=produce_frisians_snack",
                "call=produce_frisians_ration"
            }
        },
        produce_frisians_meal = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a meal because ...
            descname = _("preparing a meal"),
            actions = {
                -- time: 30.4 + 10 + 3.6 = 44 sec
                "return=skipped unless economy needs meal",
                "consume=bread_frisians honey_bread smoked_fish smoked_meat fruit",
                "playsound=sound/empire/taverns/meal priority:80%",
                "animate=working duration:30s400ms",
                "sleep=duration:10s",
                "produce=meal"
            }
        },
        produce_frisians_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = _("preparing a ration"),
            actions = {
                -- time total: 23.4 + 10 + 3.6 = 37 sec
                "return=skipped unless economy needs ration",
                "consume=bread_frisians,honey_bread fruit,smoked_fish,smoked_meat",
                "playsound=sound/empire/taverns/ration priority:80%",
                "animate=working duration:23s400ms",
                "sleep=duration:10s",
                "produce=ration"
            },
        },
        produce_frisians_snack = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack because ...
            descname = _("preparing a snack"),
            actions = {
                -- time: 27.4 + 10 + 3.6 = 41 sec
                "return=skipped unless economy needs snack",
                "consume=honey_bread fruit,smoked_fish fruit,smoked_meat",
                "playsound=sound/empire/taverns/meal priority:80%",
                "animate=working duration:27s400ms",
                "sleep=duration:10s",
                "produce=snack"
            }
        },
    },
}

pop_textdomain()
