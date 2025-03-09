push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/inn/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_inn_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Inn"),
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

    aihints = {"__replace_if_exists"},

    working_positions = {
        europeans_worker_advanced = 2
    },

    inputs = {
        { name = "beer", amount = 4 },
        { name = "bread", amount = 4 },
        { name = "mead", amount = 4 },
        { name = "honey_bread", amount = 4 },
        { name = "beer_strong", amount = 4 },
        { name = "wine", amount = 4 },
        { name = "biscuit", amount = 4 },
        { name = "meat", amount = 6 },
        { name = "fish", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=producing_ration",
                "sleep=duration:15s",
                "call=producing_snack",
                "sleep=duration:15s",
                "call=producing_meal",
                "return=skipped"
            }
        },
        producing_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration" because ...
            descname = pgettext("europeans_building", "preparing a ration"),
            actions = {
                "return=skipped when economy needs snack and not economy needs ration",
                "return=skipped when economy needs meal and not economy needs ration",
                "consume=beer bread fish,meat",
                "sleep=duration:5s",
                "playsound=sound/barbarians/taverns/tavern priority:80%",
                "animate=working duration:10s",
                "sleep=duration:5s",
                "produce=ration"
            }
        },
        producing_snack = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack" because ...
            descname = pgettext("europeans_building", "preparing a snack"),
            actions = {
                "return=skipped when economy needs ration and not economy needs snack",
                "return=skipped when economy needs meal and not economy needs snack",
                "consume=mead honey_bread fish meat",
                "sleep=duration:5s",
                "playsound=sound/barbarians/taverns/inn priority:80%",
                "animate=working duration:10s",
                "sleep=duration:5s",
                "produce=snack"
            }
        },
        producing_meal = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a meal" because ...
            descname = pgettext("europeans_building", "preparing a meal"),
            actions = {
                "return=skipped when economy needs ration and not economy needs meal",
                "return=skipped when economy needs snack and not economy needs meal",
                "consume=wine,beer_strong biscuit fish,meat",
                "sleep=duration:5s",
                "playsound=sound/empire/taverns/meal priority:80%",
                "animate=working duration:10s",
                "sleep=duration:5s",
                "produce=meal"
            }
        }
    },
}

pop_textdomain()
