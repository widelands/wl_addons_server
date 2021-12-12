push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_brewery_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Brewery"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_brewery_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2
        },
        enhancement_return_on_dismantle = {
            blackwood = 1
        }
    },

    buildcost = {
        log = 3,
        reed = 3,
        granite = 3
    },
    return_on_dismantle = {
        log = 2,
        granite = 2
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 42, 50 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 42, 50 },
        },
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 4,
        basic_amount = 1,
        prohibited_till = 2100,
        forced_after = 3000
    },

    working_positions = {
        europeans_brewer_basic = 1
    },

    inputs = {
        { name = "water", amount = 6 },
        { name = "barley", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=brew_beer",
                "call=brew_beer_idle",
                "return=skipped"
            }
        },
        brew_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
            descname = _"brewing beer",
            actions = {
                "return=skipped when economy needs water and not economy needs beer",
                "return=skipped unless economy needs beer or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water:3 barley:3",
                "sleep=duration:10s",
                "animate=working duration:80s",
                "produce=beer:3"
            }
        },
        brew_beer_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs beer",
                "return=skipped when economy needs water",
                "sleep=duration:90s",
                "consume=water barley",
                "animate=working duration:80s",
                "produce=beer"
            }
        }
    },
}

pop_textdomain()
