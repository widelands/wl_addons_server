push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_weaving_mill_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Weaving Mill"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_weaving_mill_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            grout = 2,
            marble_column = 2
        },
        enhancement_return_on_dismantle = {
            granite = 2,
            marble = 2,
            planks = 1
        }
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 65, 69 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 65, 69 },
        }
    },

    aihints = {},

    working_positions = {
        europeans_weaver_normal = 1
    },

    inputs = {
        { name = "reed", amount = 6 },
        { name = "spider_silk", amount = 6 },
        { name = "wool", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_cloth",
                "call=produce_spidercloth",
                "call=produce_tabard",
                "call=produce_armor",
                "call=produce_spidercloth_idle",
                "return=skipped"
            }
        },
        produce_cloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = _"weaving cloth",
            actions = {
                "return=skipped when economy needs reed and not economy needs cloth",
                "consume=reed:3",
                "sleep=duration:10s",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:40s",
                "produce=cloth:3"
            }
        },
        produce_spidercloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving spidercloth because ...
            descname = _"weaving spidercloth",
            actions = {
                "return=skipped unless economy needs spidercloth",
                "consume=spider_silk:3",
                "sleep=duration:10s",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:40s",
                "produce=spidercloth:3"
            }
        },
        produce_tabard = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring a tabard because ...
            descname = _"tailoring a tabard",
            actions = {
                "return=skipped unless economy needs tabard",
                "consume=spider_silk",
                "sleep=duration:10s",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:40s",
                "produce=tabard"
            }
        },
        produce_armor = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring an armor because ...
            descname = _"tailoring an armor",
            actions = {
                "return=skipped unless economy needs armor",
                "consume=wool",
                "sleep=duration:10s",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:40s",
                "sleep=duration:5s",
                "produce=armor"
            }
        },
        produce_spidercloth_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs cloth",
                "return=skipped when economy needs spidercloth",
                "return=skipped when economy needs tabard",
                "return=skipped when economy needs armor",
                "sleep=duration:90s",
                "consume=spider_silk",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:60s",
                "produce=spidercloth"
            }
        }
    },
}

pop_textdomain()
