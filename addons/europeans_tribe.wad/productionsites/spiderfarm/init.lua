push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_spiderfarm",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Spider Farm"),
    icon = dirname .. "menu.png",
    size = "big",

    buildcost = {
        blackwood = 2,
        planks = 2,
        reed = 2,
        cloth = 2,
        brick = 2,
        grout = 2
    },
    return_on_dismantle = {
        blackwood = 1,
        planks = 1,
        granite = 2
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 87, 75 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 87, 75 },
        }
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
        prohibited_till = 5400,
        forced_after = 7200
    },

    working_positions = {
        europeans_breeder_basic = 2
    },

    inputs = {
        { name = "water", amount = 6 },
        { name = "corn", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_spidersilk",
                "call=produce_spidersilk_idle",
                "return=skipped"
            }
        },
        produce_spidersilk = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing spider silk because ...
            descname = _"producing spider silk",
            actions = {
                "return=skipped unless economy needs spider_silk or workers need experience",
                "return=skipped unless site has water:2",
                "consume=corn:2 water:2",
                "sleep=duration:10s",
                "animate=working duration:60s",
                "produce=spider_silk:2"
            }
        },
        produce_spidersilk_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs spider_silk",
                "return=skipped when economy needs water",
                "sleep=duration:90s",
                "consume=corn water",
                "animate=working duration:60s",
                "produce=spider_silk"
            }
        }
    },
}

pop_textdomain()
