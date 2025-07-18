push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/reindeer_farm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_animal_farm_level_5",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Reindeer Farm"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {84, 59}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {84, 81},
            frames = 20,
            columns = 5,
            rows = 4,
            fps = 10
        },
        working = {
            hotspot = {84, 81},
            frames = 20,
            columns = 5,
            rows = 4,
            fps = 10
        }
    },

    size = "big",

    aihints = {
        prohibited_till = 3600,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        europeans_worker_basic = 2,
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "fruit", amount = 8 },
        { name = "honey", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                -- time total: 30 + 38.6 + 30 + 38.6 + 30 + 42.2 = 209.4 sec
                "call=recruit_deer",
                "call=make_wool",
                "call=recruit_deer",
                "call=make_wool",
                "call=recruit_deer",
                "call=make_leather",
                "call=recruit_deer",
                "call=make_fur",
            }
        },
        recruit_deer = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing reindeer because ...
            descname = pgettext("europeans_building", "rearing reindeer"),
            actions = {
                -- time: 15 + 15 = 30 sec
                "return=skipped unless economy needs europeans_carrier_reindeer",
                "consume=water fruit honey",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "recruit=europeans_carrier_reindeer"
            }
        },
        make_leather = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing fur because ...
            descname = pgettext("europeans_building", "producing fur"),
            actions = {
                -- time: 15 + 20 + 3.6 = 38.6 sec
                "return=skipped unless economy needs leather",
                "consume=water fruit honey",
                "sleep=duration:15s",
                "animate=working duration:20s",
                "produce=leather"
            }
        },
        make_fur = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing fur because ...
            descname = pgettext("europeans_building", "producing fur"),
            actions = {
                -- time: 15 + 20 + 2 * 3.6 = 42.2 sec
                "return=skipped unless economy needs fur",
                "consume=water fruit honey",
                "sleep=duration:15s",
                "animate=working duration:20s",
                "produce=fur"
            }
        },
        make_wool = {
            -- TRANSLATORS: Completed/Skipped/Did not start making wool because ...
            descname = _("breeding reindeer and producing wool"),
            actions = {
                "return=skipped unless economy needs wool",
                "consume=water fruit honey",
                "sleep=duration:15s",
                "animate=working duration:20s",
                "produce=wool"
            }
        },
    },
}

pop_textdomain()
