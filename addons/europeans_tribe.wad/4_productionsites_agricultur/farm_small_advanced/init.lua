push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_small_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Small Farm"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 39, 61 }
        },
        working = {
            basename = "idle",
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 39, 61 }
        }
    },
    
    size = "small",

    aihints = {
        space_consumer = true,
        very_weak_ai_limit = 2,
        weak_ai_limit = 4,
        normal_ai_limit = 8,
    },

    working_positions = {
        europeans_gardener_advanced = 1
    },

    inputs = {
        { name = "water", amount = 8 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=planting",
                "sleep=duration:1s",
                "call=watering",
                "sleep=duration:1s",
                "call=planting",
                "sleep=duration:1s",
                "call=watering",
                "sleep=duration:1s",
                "call=harvesting",
                "sleep=duration:1s",
                "call=harvesting",
                "return=skipped"
            }
        },
        planting = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting because ...
            descname = pgettext("europeans_building", "planting reed and cotton"),
            actions = {
                "sleep=duration:1s",
                "callworker=check_dig_space",
                "call=making_pond",
                "sleep=duration:1s",
                "call=planting_reed",
                "sleep=duration:1s",
                "call=making_pond",
                "sleep=duration:1s",
                "call=planting_cotton"
            }
        },
        watering = {
            -- TRANSLATORS: Completed/Skipped/Did not start watering because ...
            descname = pgettext("europeans_building", "watering fields"),
            actions = {
                "sleep=duration:1s",
                "callworker=check_growable_plants",
                "return=skipped unless site has water",
                "consume=water",
                "callworker=watering"
            }
        },
        making_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start making pond because ...
            descname = pgettext("europeans_building", "making a pond with water"),
            actions = {
                "call=digging_clay",
                "sleep=duration:1s",
                "call=digging_pond",
                "sleep=duration:1s",
                "call=filling_pond"
            }
        },
        digging_clay = {
            -- TRANSLATORS: Completed/Skipped/Did not start digging clay because ...
            descname = pgettext("europeans_building", "digging clay"),
            actions = {
                "return=skipped unless economy needs clay or economy needs brick",
                "callworker=dig",
                "return=skipped unless site has water",
                "consume=water",
                "animate=working duration:1s",
                "produce=clay"
            }
        },
        digging_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start digging pond because ...
            descname = pgettext("europeans_building", "digging a dry pond"),
            actions = {
                "return=skipped when economy needs clay",
                "return=skipped unless site has water",
                "callworker=check_dig_space",
                "consume=water",
                "callworker=dig",
                "animate=working duration:1s"
            }
        },
        filling_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start filling pond because ...
            descname = pgettext("europeans_building", "filling pond with water"),
            actions = {
                "callworker=check_pond_dry",
                "return=skipped unless site has water",
                "consume=water",
                "animate=working duration:1s",
                "callworker=fill_pond_dry"
            }
        },
        planting_cotton = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting cotton because ...
            descname = pgettext("europeans_building", "planting cotton"),
            actions = {
                "callworker=check_pond_water",
                "animate=working duration:1s",
                "callworker=plant_cotton"
            }
        },
        planting_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = pgettext("europeans_building", "planting reed"),
            actions = {
                "callworker=check_pond_water",
                "animate=working duration:1s",
                "callworker=plant_reed"
            }
        },
        harvesting = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting because ...
            descname = pgettext("europeans_building", "harvesting"),
            actions = {
                "sleep=duration:2s",
                "callworker=check_fields",
                "call=harvesting_reed",
                "sleep=duration:2s",
                "call=harvesting_cotton"
            }
        },
        harvesting_cotton = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting cotton because ...
            descname = pgettext("europeans_building", "harvesting cotton"),
            actions = {
                "callworker=harvest_cotton",
                "produce=cotton"
            }
        },
        harvesting_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = pgettext("europeans_building", "harvesting reed"),
            actions = {
                "callworker=harvest_reed",
                "produce=reed"
            }
        },
    },
}

pop_textdomain()
