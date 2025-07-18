push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/honey_bread_bakery/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_bakery_level_5",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Bakery Level 5"),
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
        prohibited_till = 3600,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        amazons_cook = 1,
        atlanteans_baker = 1,
        barbarians_baker = 1,
        empire_baker = 1,
        frisians_baker = 1,
        frisians_baker_master = 1
    },

    inputs = {
        { name = "water", amount = 16 },
        { name = "cassavaroot", amount = 4 },
        { name = "blackroot_flour", amount = 4 },
        { name = "cornmeal", amount = 4 },
        { name = "flour", amount = 4 },
        { name = "rye_flour", amount = 4 },
        { name = "barley_flour", amount = 4 },
        { name = "oat_flour", amount = 4 },
        { name = "honey", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_frisians_honey_bread",
                "call=produce_frisians_bread",
                "call=produce_empire_bread",
                "call=produce_atlanteans_bread",
                "call=produce_amazons_bread",
                "call=produce_barbarians_bread",
                "return=skipped"
            }
        },
        produce_amazons_bread = {
            -- TRANSLATORS: Completed/Skipped/Did not start baking bread because ...
                descname = pgettext("europeans_building", "baking amazons bread"),
            actions = {
                -- time total: 5.4 + 18 + 10 + 3.6 = 37 sec
                "return=skipped unless economy needs amazons_bread",
                "consume=water:2 cassavaroot",
                "sleep=duration:5s400ms",
                "animate=working duration:18s",
                "sleep=duration:10s",
                "produce=amazons_bread"
            }
        },
        produce_atlanteans_bread = {
            -- TRANSLATORS: Completed/Skipped/Did not start baking bread because ...
                descname = pgettext("europeans_building", "baking atlanteans bread"),
            actions = {
                -- time total: 34.8 + 30 + 2 * 3.6 = 72 sec
                "return=skipped unless economy needs atlanteans_bread",
                "consume=water:2 blackroot_flour cornmeal",
                "animate=working duration:34s800ms",
                "sleep=duration:30s",
                "produce=atlanteans_bread:2"
            }
        },
        produce_barbarians_bread = {
                -- TRANSLATORS: Completed/Skipped/Did not start baking bread because ...
                descname = pgettext("europeans_building", "baking barbarians bread"),
                actions = {
                -- time total: 20.8 + 2 * (20 + 3.6) = 68 sec
                "return=skipped unless economy needs barbarians_bread",
                "consume=water:2 flour:2",
                "sleep=duration:20s800ms",
                "animate=working duration:20s",
                "produce=barbarians_bread",
                "animate=working duration:20s",
                "produce=barbarians_bread"
            }
        },
        produce_empire_bread = {
                -- TRANSLATORS: Completed/Skipped/Did not start baking bread because ...
                descname = pgettext("europeans_building", "baking empire bread"),
                actions = {
                -- time total: 20.4 + 10 + 3.6 = 34 sec
                "return=skipped unless economy needs empire_bread",
                "consume=water:2 flour rye_flour",
                "sleep=duration:40s800ms",
                "animate=working duration:20s",
                "produce=empire_bread:2"
            }
        },
        produce_frisians_bread = {
                -- TRANSLATORS: Completed/Skipped/Did not start baking bread because ...
                descname = pgettext("europeans_building", "baking frisians bread"),
                actions = {
                -- time total: 20.4 + 20 + 3.6 = 44 sec
                "return=skipped unless economy needs bread_frisians or workers need experience",
                "consume=water:2 barley_flour oat_flour",
                "sleep=duration:20s400ms",
                "animate=working duration:20s",
                "produce=bread_frisians:2"
            }
        },
        produce_frisians_honey_bread = {
                -- TRANSLATORS: Completed/Skipped/Did not start baking bread because ...
                descname = pgettext("europeans_building", "baking frisians honey bread"),
                actions = {
                -- time: 17.067 + 25 + 3.6 = 45.667 sec
                "return=skipped unless economy needs honey_bread or workers need experience",
                "consume=water:2 honey:2 barley_flour oat_flour",
                "sleep=duration:17s067ms",
                "animate=working duration:30s",
                "produce=honey_bread:2"
            }
        },
    },
}

pop_textdomain()
