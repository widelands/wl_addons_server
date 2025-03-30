push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/tavern/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_inn_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Inn"),
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
        name = "europeans_inn_advanced",
        enhancement_cost = {
            brick = 2,
            grout = 2,
        },
        enhancement_return_on_dismantle = {
            granite = 2
        }
    },

    aihints = {},

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "beer", amount = 4 },
        { name = "bread", amount = 4 },
        { name = "mead", amount = 4 },
        { name = "honey_bread", amount = 4 },
        { name = "meat", amount = 4 },
        { name = "fish", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=producing_ration",
                "sleep=duration:30s",
                "call=producing_snack",
                "return=skipped"
            }
        },
        producing_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration" because ...
            descname = pgettext("europeans_building", "preparing a ration"),
            actions = {
                "return=skipped unless economy needs ration",
                "return=skipped when economy needs snack and not economy needs ration",
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
                "return=skipped unless economy needs snack",
                "return=skipped when economy needs ration and not economy needs snack",
                "consume=mead honey_bread fish,meat",
                "sleep=duration:5s",
                "playsound=sound/barbarians/taverns/inn priority:80%",
                "animate=working duration:10s",
                "sleep=duration:5s",
                "produce=snack"
            }
        }
    },
}

pop_textdomain()
