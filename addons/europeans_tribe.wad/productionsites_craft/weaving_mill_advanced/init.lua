push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_weaving_mill_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Weaving Mill"),
    icon = dirname .. "menu.png",
    size = "medium",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 65, 62 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 65, 62 },
        },
        unoccupied = {
            pictures = path.list_files(dirname .. "unoccupied_??.png"),
            hotspot = { 65, 62 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 65, 62 },
            fps = 5
        },
    },

    aihints = {},

    working_positions = {
        europeans_weaver_advanced = 1,
        europeans_weaver_basic = 1
    },

    inputs = {
        { name = "reed", amount = 6 },
        { name = "wool", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_cloth",
                "call=produce_tabard",
                "call=produce_armor",
                "call=produce_armor_idle",
                "return=skipped"
            }
        },
        produce_cloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = pgettext("europeans_building", "weaving cloth"),
            actions = {
                "return=skipped unless economy needs cloth",
                "return=skipped unless site has reed:3",
                "consume=reed:3",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:20s",
                "produce=cloth:3",
                "sleep=duration:30s"
            }
        },
        produce_tabard = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring a tabard because ...
           descname = pgettext("europeans_building", "tailoring a tabard"),
            actions = {
                "return=skipped unless economy needs tabard",
                "return=skipped unless site has reed:3",
                "consume=reed:3",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:20s",
                "produce=tabard:3",
                "sleep=duration:30s"
            }
        },
        produce_armor = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring an armor because ...
            descname = pgettext("europeans_building", "forging a suit of armor"),
            actions = {
                "return=skipped unless economy needs armor",
                "return=skipped unless site has wool:4",
                "consume=wool:4",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:20s",
                "produce=armor:4",
                "sleep=duration:30s"
            }
        },
        produce_armor_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs tabard",
                "return=skipped when economy needs armor",
                "consume=reed wool",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:60s",
                "produce=tabard",
                "animate=working duration:60s",
                "produce=armor",
                "sleep=duration:120s"
            }
        }
    },
}

pop_textdomain()
