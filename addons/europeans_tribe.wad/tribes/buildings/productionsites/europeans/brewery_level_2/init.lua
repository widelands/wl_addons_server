push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/amazons/chocolate_brewery/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_brewery_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Brewery Level 2"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {hotspot = {43, 44}},
        unoccupied = {hotspot = {43, 44}},
    },
    spritesheets = {
        working = {
            hotspot = {43, 44},
            fps = 15,
            frames = 30,
            columns = 6,
            rows = 5
        }
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_brewery_level_3",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            spidercloth = 2
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            grout = 1,
            spidercloth = 1
        }
    },

    aihints = {
        prohibited_till = 3000,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        amazons_cook = 1,
        barbarians_brewer_master = 1,
        barbarians_brewer = 1
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "wheat", amount = 4 },
        { name = "cocoa_beans", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=brew_chocolate",
                "call=brew_beer_strong",
                "call=brew_beer",
                "return=skipped"
            }
        },
        brew_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
            descname = pgettext("europeans_building", "brewing simple wheat beer"),
            actions = {
                -- time total: 30.4 + 30 + 3.6 = 64 sec
                "return=skipped unless economy needs beer",
                "consume=water wheat",
                "sleep=duration:30s400ms",
                "playsound=sound/empire/beerbubble priority:40% allow_multiple",
                "animate=working duration:30s",
                "produce=beer"
            }
        },
        brew_beer_strong = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
            descname = pgettext("europeans_building", "brewing strong wheat beer"),
            actions = {
                -- time total: 30.4 + 30 + 3.6 = 64 sec
                "return=skipped unless economy needs beer_strong",
                "consume=water wheat",
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
    },
}

pop_textdomain()
