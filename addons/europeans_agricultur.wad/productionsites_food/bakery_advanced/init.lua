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

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "flour", amount = 8 },
        { name = "honey", amount = 4 },
        { name = "fruit", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_biscuits",
                "sleep=duration:20s",
                "call=produce_honey_bread",
                "sleep=duration:20s",
                "call=produce_bread",
                "return=skipped"
            }
        },
        produce_bread = {
            -- TRANSLATORS: Completed/Skipped/Did not start Baking bread because ...
            descname = pgettext("europeans_building", "Baking bread"),
            actions = {
                "return=skipped when economy needs water and not economy needs bread",
                "return=skipped when economy needs flour and not economy needs bread",
                "return=skipped when economy needs honey_bread and not economy needs bread",
                "return=skipped when economy needs biscuit and not economy needs bread",
                "consume=water:2 flour:2",
                "animate=working duration:2m",
                "produce=bread:2"
            }
        },
        produce_honey_bread = {
            -- TRANSLATORS: Completed/Skipped/Did not start Baking bread because ...
            descname = pgettext("europeans_building", "Baking honey bread"),
            actions = {
                "return=skipped when economy needs water and not economy needs honey_bread",
                "return=skipped when economy needs flour and not economy needs honey_bread",
                "return=skipped when economy needs honey and not economy needs honey_bread",
                "return=skipped when economy needs bread and not economy needs honey_bread",
                "return=skipped when economy needs biscuit and not economy needs honey_bread",
                "return=skipped unless site has honey",
                "consume=water:2 flour:2 honey",
                "animate=working duration:2m",
                "produce=honey_bread:2"
            }
        },
        produce_biscuits = {
            -- TRANSLATORS: Completed/Skipped/Did not start Baking bread because ...
            descname = pgettext("europeans_building", "Baking fruit biscuits"),
            actions = {
                "return=skipped when economy needs water and not economy needs biscuit",
                "return=skipped when economy needs flour and not economy needs biscuit",
                "return=skipped when economy needs honey and not economy needs biscuit",
                "return=skipped when economy needs fruit and not economy needs biscuit",
                "return=skipped when economy needs bread and not economy needs biscuit",
                "return=skipped when economy needs honey_bread and not economy needs biscuit",
                "return=skipped unless site has honey",
                "consume=water:2 flour:2 honey fruit:2",
                "animate=working duration:2m",
                "produce=biscuit:2"
            }
        },
    },
}

pop_textdomain()
