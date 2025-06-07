push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/frisians/berry_farm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_fruit_farm_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Berry Farm"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {40, 55}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {40, 73},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },

    size = "small",

    aihints = {
        space_consumer = true,
        prohibited_till = 5400,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        frisians_berry_farmer = 1,
        frisians_fruit_collector = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=planting_grape",
                "call=planting_berry_bushes",
                "call=gathering_grape",
                "call=gathering_berries",
            }
        },
        gathering_berries = {
            -- TRANSLATORS: Completed/Skipped/Did not start gathering berries because ...
            descname = _("gathering berries"),
            actions = {
                "return=skipped unless economy needs fruit",
                "sleep=duration:21s",
                "callworker=harvest_berry",
            }
        },
        gathering_grape = {
            -- TRANSLATORS: Completed/Skipped/Did not start gathering berries because ...
            descname = _("gathering berries"),
            actions = {
                "return=skipped unless economy needs grape",
                "sleep=duration:21s",
                "callworker=harvest_grape",
            }
        },
        planting_berry_bushes = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting bushes because ...
            descname = _("planting bushes"),
            actions = {
                "return=skipped unless economy needs fruit or economy needs honey",
                "callworker=plant_berry",
                "sleep=duration:21s"
            }
        },
        planting_grape = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting bushes because ...
            descname = _("planting bushes"),
            actions = {
                "return=skipped unless economy needs grape or economy needs honey",
                "callworker=plant_grape",
                "sleep=duration:21s"
            }
        },
    },
}

pop_textdomain()
