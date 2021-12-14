push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_brewery_winery",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Brewery and Winery"),
    icon = dirname .. "menu.png",
    size = "medium",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 39, 62 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 39, 62 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_brewer_normal = 1,
        europeans_brewer_advanced = 1
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "barley", amount = 8 },
        { name = "honey", amount = 6 },
        { name = "fruit", amount = 4 },
        { name = "grape", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=brew_beer",
                "call=brew_mead",
                "call=brew_strong_beer",
                "call=making_wine",
                "call=making_wine_idle",
                "return=skipped"
            }
        },
        brew_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
            descname = _"brewing beer",
            actions = {
                "return=skipped when economy needs water and not economy needs beer",
                "return=skipped unless economy needs beer or workers need experience",
                "return=skipped when site has honey and economy needs mead and not economy needs beer",
                "return=skipped when site has barley and economy needs beer_strong and not economy needs beer",
                "return=skipped unless site has water:3",
                "consume=water:3 barley:3",
                "sleep=duration:10s",
                "animate=working duration:60s",
                "produce=beer:3"
            }
        },
        brew_mead = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing mead because ...
            descname = _"brewing mead",
            actions = {
                "return=skipped when economy needs water and not economy needs mead",
                "return=skipped unless economy needs mead or workers need experience",
                "return=skipped when site has barley and economy needs beer and not economy needs mead",
                "return=skipped when site has barley and economy needs beer_strong and not economy needs mead",
                "return=skipped unless site has water:3",
                "consume=water:3 barley:3 honey:3",
                "sleep=duration:10s",
                "animate=working duration:60s",
                "produce=mead:3"
            }
        },
        brew_strong_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing strong beer because ...
            descname = _"brewing strong beer",
            actions = {
                "return=skipped when economy needs water and not economy needs beer_strong",
                "return=skipped unless economy needs beer_strong or workers need experience",
                "return=skipped when site has barley and economy needs beer and not economy needs beer_strong",
                "return=skipped when site has honey and economy needs mead and not economy needs beer_strong",
                "return=skipped unless site has water:4",
                "consume=water:4 barley:4",
                "sleep=duration:10s",
                "animate=working duration:70s",
                "produce=beer_strong:3"
            }
        },
        making_wine = {
            -- TRANSLATORS: Completed/Skipped/Did not start making wine because ...
            descname = _"making wine",
            actions = {
                -- Grapes are only needed for wine, so no need to check if wine is needed
                "return=skipped when economy needs water and not economy needs wine",
                "return=skipped unless economy needs wine or workers need experience",
                "return=skipped unless site has water",
                "consume=water fruit grape:4",
                "sleep=duration:10s",
                "playsound=sound/empire/winebubble priority:40% allow_multiple",
                "animate=working duration:70s",
                "produce=wine:3"
            }
        },
        making_wine_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs beer",
                "return=skipped when economy needs beer_strong",
                "return=skipped when economy needs mead",
                "return=skipped when economy needs wine",
                "return=skipped when economy needs water",
                "sleep=duration:90s",
                "consume=water:5 barley:4 honey fruit grape",
                "animate=working duration:80s",
                "produce=beer",
                "sleep=duration:90s",
                "animate=working duration:90s",
                "produce=beer_strong",
                "sleep=duration:90s",
                "animate=working duration:90s",
                "produce=mead",
                "sleep=duration:90s",
                "playsound=sound/empire/winebubble priority:40% allow_multiple",
                "animate=working duration:70s",
                "produce=wine"
            }
        }
    },
}

pop_textdomain()
