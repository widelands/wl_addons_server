push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_bakery_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Bakery"),
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

    aihints = {},

    working_positions = {
        europeans_baker_advanced = 1,
        europeans_baker_basic = 1
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "flour", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_bread",
                "return=skipped"
            }
        },
        produce_bread = {
            -- TRANSLATORS: Completed/Skipped/Did not start Baking bread because ...
            descname = pgettext("europeans_building", "Baking bread"),
            actions = {
                "return=skipped unless economy needs bread or workers need experience",
                "return=skipped when economy needs water and not economy needs bread",
                "return=skipped unless site has water:2",
                "return=skipped unless site has flour:2",
                "consume=water:2 flour:2",
                "animate=working duration:40",
                "produce=bread:2"
            }
        },
    },
}

pop_textdomain()