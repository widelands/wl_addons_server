push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_stonemasons_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Stonemason’s House"),
    icon = dirname .. "menu.png",
    size = "medium",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 58, 61 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 58, 61 },
        },
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 1
    },

    working_positions = {
        europeans_stonemason_advanced = 1,
        europeans_stonemason_basic = 2
    },

    inputs = {
        { name = "marble", amount = 9 },
        { name = "granite", amount = 9 },
        { name = "clay", amount = 6 },
        { name = "water", amount = 6 },
        { name = "coal", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=sculpting_marble_column",
                "call=mixing_grout",
                "call=burning_bricks",
                "call=burning_bricks_idle",
                "return=skipped"
            }
        },
        mixing_grout = {
            -- TRANSLATORS: Completed/Skipped/Did not start mixing grout because ...
            descname = pgettext("europeans_building", "mixing grout"),
            actions = {
                "return=skipped when economy needs granite",
                "return=skipped when economy needs water and not economy needs grout",
                "return=skipped when economy needs coal and not economy needs grout",
                "return=skipped unless site has coal:2",
                "return=skipped unless site has granite:3",
                "return=skipped unless site has water:3",
                "consume=coal:2 granite:3 water:3",
                "sleep=duration:5s",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:30s",
                "playsound=sound/barbarians/mortar priority:60%",
                "sleep=duration:3s",
                "produce=grout:3"
            }
        },
        burning_bricks = {
            -- TRANSLATORS: Completed/Skipped/Did not start burning bricks because ...
            descname = pgettext("europeans_building", "burning bricks"),
            actions = {
                "return=skipped when economy needs granite",
                "return=skipped when economy needs coal and not economy needs brick",
                "return=skipped unless site has coal:2",
                "return=skipped unless site has clay:3",
                "consume=coal:2 granite clay:3",
                "sleep=duration:5s",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:30s",
                "sleep=duration:3s",
                "produce=brick:3"
            }
        },
        sculpting_marble_column = {
            -- TRANSLATORS: Completed/Skipped/Did not start sculpting a marble column because ...
            descname = pgettext("europeans_building", "sculpting a marble column"),
            actions = {
                "return=skipped unless economy needs marble_column or workers need experience",
                "return=skipped when economy needs marble",
                "return=skipped unless site has marble:6",
                "consume=marble:3",
                "sleep=duration:5s",
                "playsound=sound/stonecutting/stonemason priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=marble_column:2",
                "sleep=duration:5s",
                "consume=marble:3",
                "sleep=duration:5s",
                "playsound=sound/stonecutting/stonemason priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=marble_column:2"
            }
        },
        burning_bricks_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs marble_column",
                "return=skipped when economy needs brick",
                "return=skipped when economy needs grout",
                "return=skipped when economy needs granite",
                "return=skipped when economy needs coal",
                "return=skipped when economy needs water",
                "sleep=duration:120s",
                "consume=coal:2 granite:2 water clay",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:15s",
                "sleep=duration:3s",
                "produce=brick",
                "sleep=duration:90s",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:15s",
                "playsound=sound/barbarians/mortar priority:60%",
                "sleep=duration:3s",
                "produce=grout"
            }
        }
    },
}

pop_textdomain()