push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/bakery/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_bakery_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Bakery Level 3"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 50, 62 },
        },
        build = {
            frames = 4,
            columns = 4,
            rows = 1,
            hotspot = { 50, 62 },
        },
        working = {
            fps = 2,
            frames = 20,
            columns = 10,
            rows = 2,
            hotspot = { 50, 62 },
        },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_bakery_level_4",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            reed = 2
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            grout = 1,
            reed = 1
        }
    },

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
        empire_baker = 1
    },

    inputs = {
        { name = "water", amount = 12 },
        { name = "cassavaroot", amount = 4 },
        { name = "blackroot_flour", amount = 4 },
        { name = "cornmeal", amount = 4 },
        { name = "flour", amount = 4 },
        { name = "rye_flour", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_empire_bread",
                "call=produce_atlanteans_bread",
                "call=produce_amazons_bread",
                "call=produce_barbarians_bread",
                "return=skipped"
            }
        },
        produce_amazons_bread = {
            -- TRANSLATORS: Completed/Skipped/Did not start baking bread because ...
                descname = pgettext("europeans_building", "Baking amazons bread"),
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
                descname = pgettext("europeans_building", "Baking atlanteans bread"),
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
                descname = pgettext("europeans_building", "Baking barbarians bread"),
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
                descname = pgettext("europeans_building", "Baking empire bread"),
                actions = {
                -- time total: 20.4 + 10 + 3.6 = 34 sec
                "return=skipped unless economy needs empire_bread",
                "consume=water:2 flour rye_flour",
                "sleep=duration:40s800ms",
                "animate=working duration:20s",
                "produce=empire_bread:2"
            }
        },
    },
}

pop_textdomain()
