push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/mead_brewery/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_brewery_level_6",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Brewery Level 6"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {50, 70}
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
        prohibited_till = 3000,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        amazons_cook = 1,
        barbarians_brewer_master = 1,
        barbarians_brewer = 1,
        empire_brewer = 1,
        empire_vintner = 1,
        frisians_brewer = 1,
        frisians_brewer_master = 1
    },

    inputs = {
        { name = "water", amount = 10 },
        { name = "barley", amount = 6 },
        { name = "cocoa_beans", amount = 4 },
        { name = "grape", amount = 4 },
        { name = "honey", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=brew_mead",
                "call=brew_wine",
                "call=brew_chocolate",
                "call=brew_beer_strong",
                "call=brew_beer",
                "return=skipped"
            }
        },
        brew_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
            descname = pgettext("europeans_building", "brewing simple barley beer"),
            actions = {
                -- time total: 30.4 + 30 + 3.6 = 64 sec
                "return=skipped unless economy needs beer",
                "consume=water barley",
                "sleep=duration:30s400ms",
                "playsound=sound/empire/beerbubble priority:40% allow_multiple",
                "animate=working duration:30s",
                "produce=beer"
            }
        },
        brew_beer_strong = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
            descname = pgettext("europeans_building", "brewing strong barley beer"),
            actions = {
                -- time total: 30.4 + 30 + 3.6 = 64 sec
                "return=skipped unless economy needs beer_strong",
                "consume=water barley",
                "sleep=duration:30s400ms",
                "playsound=sound/empire/beerbubble priority:40% allow_multiple",
                "animate=working duration:30s",
                "produce=beer_strong"
            }
        },
        brew_chocolate = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing chocolate because ...
            descname = pgettext("europeans_building", "brewing chocolate"),
            actions = {
                -- time total: 30.4 + 30 + 3.6 = 64 sec
                "return=skipped unless economy needs chocolate",
                "consume=water:2 cocoa_beans",
                "sleep=duration:30s400ms",
                "playsound=sound/empire/beerbubble priority:40% allow_multiple",
                "animate=working duration:30s",
                "produce=chocolate"
            }
        },
        brew_mead = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing mead because ...
            descname = pgettext("europeans_building", "brewing mead"),
            actions = {
                -- time: 27.067 + 35 + 3.6 = 65.667 sec
                "return=skipped unless economy needs mead or workers need experience",
                "consume=water barley honey",
                "sleep=duration:27s067ms",
                "playsound=sound/empire/beerbubble priority:40% allow_multiple",
                "animate=working duration:35s",
                "produce=mead"
            }
        },
        brew_wine = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing wine because ...
            descname = pgettext("europeans_building", "brewing wine"),
            actions = {
                -- time total: 30.4 + 30 + 3.6 = 64 sec
                "return=skipped unless economy needs wine",
                "consume=grape:2",
                "sleep=duration:30s400ms",
                "playsound=sound/empire/winebubble priority:40% allow_multiple",
                "animate=working duration:30s",
                "produce=wine"
            }
        },
    },
}

pop_textdomain()
