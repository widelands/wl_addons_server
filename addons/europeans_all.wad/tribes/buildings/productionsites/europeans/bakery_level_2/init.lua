push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/atlanteans/bakery/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_bakery_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Bakery Level 2"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 54, 74 },
        },
    },

    spritesheets = {
        working = {
            fps = 20,
            frames = 5,
            columns = 5,
            rows = 1,
            hotspot = { 54, 74 },
        },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_bakery_level_3",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            grout = 1,
            marble = 1
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
        barbarians_baker = 1
    },

    inputs = {
        { name = "water", amount = 10 },
        { name = "wheat", amount = 4 },
        { name = "cassavaroot", amount = 4 },
        { name = "blackroot_flour", amount = 4 },
        { name = "cornmeal", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
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
                "consume=cassavaroot water:2",
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
                "consume=water:3 wheat:3",
                "sleep=duration:20s800ms",
                "animate=working duration:20s",
                "produce=barbarians_bread",
                "animate=working duration:20s",
                "produce=barbarians_bread"
            }
        },
    },
}

pop_textdomain()
