push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/amazons/gardening_center/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_gardening_center",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Gardening Center"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {hotspot = {43, 44}},
    },
    spritesheets = {
        idle = {
            hotspot = {43, 44},
            fps = 4,
            frames = 4,
            columns = 2,
            rows = 2
        },
        working = {
            basename = "idle",
            hotspot = {43, 44},
            fps = 4,
            frames = 4,
            columns = 2,
            rows = 2
        }
    },

    size = "medium",

    aihints = {
        space_consumer = true,
        prohibited_till = 3600,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        europeans_gardener_advanced = 2
    },

    inputs = {
        { name = "water", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=planting_fields",
                "sleep=duration:1s",
                "call=watering",
                "sleep=duration:1s",
                "call=planting_trees",
                "sleep=duration:1s",
                "call=watering",
                "sleep=duration:1s",
                "call=planting_fields",
                "sleep=duration:1s",
                "call=watering",
                "sleep=duration:1s",
                "call=planting_trees",
                "sleep=duration:1s",
                "call=watering",
                "return=skipped"
            }
        },
        planting_fields = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting because ...
            descname = pgettext("europeans_building", "planting reed and cotton"),
            actions = {
                "callworker=check_dig_space",
                "call=making_pond",
                "call=planting_reed",
                "call=planting_cotton",
                "call=plant_berrybush"
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
        plant_berrybush = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting berrybush because ...
            descname = pgettext("europeans_building", "planting berry bushes"),
            actions = {
                "return=skipped unless site has water",
                "consume=water",
                "callworker=plant_berrybush",
                "animate=working duration:1s"
            }
        },
        planting_cotton = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting cotton because ...
            descname = pgettext("europeans_building", "planting cotton"),
            actions = {
                "return=skipped unless economy needs cotton",
                "callworker=check_pond_water",
                "animate=working duration:1s",
                "callworker=plant_cotton"
            }
        },
        planting_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = pgettext("europeans_building", "planting reed"),
            actions = {
                "return=skipped unless economy needs reed",
                "callworker=check_pond_water",
                "animate=working duration:1s",
                "callworker=plant_reed"
            }
        },
        planting_trees = {
            -- TRANSLATORS: Completed/Skipped/Did not start enhancing the fertility of land because ...
            descname = pgettext("europeans_building", "planting trees and enhancing the fertility of land"),
            actions = {
                "call=plant_liana",
                "call=plant_balsa",
                "call=plant_rubber",
                "call=plant_ironwood"
            }
        },
        plant_balsa = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing only one ration because ... (can produce more efficient when supply is good)
            descname = pgettext("europeans_building", "planting balsa tree"),
            actions = {
                "return=skipped unless economy needs balsa or economy needs log",
                "callworker=plant_balsa_tree",
                "sleep=duration:10s"
            },
        },
        plant_ironwood = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing only one ration because ... (can produce more efficient when supply is good)
            descname = pgettext("europeans_building", "planting ironwood tree"),
            actions = {
                "return=skipped unless economy needs ironwood or economy needs log",
                "callworker=plant_ironwood_tree",
                "sleep=duration:10s"
            },
        },
        plant_liana = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing only one ration because ... (can produce more efficient when supply is good)
            descname = pgettext("europeans_building", "planting liana tree"),
            actions = {
                "return=skipped unless economy needs liana or economy needs log",
                "callworker=plant_liana_tree",
                "sleep=duration:10s"
            },
        },
        plant_rubber = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing only one ration because ... (can produce more efficient when supply is good)
            descname = pgettext("europeans_building", "planting rubber tree"),
            actions = {
                "return=skipped unless economy needs rubber or economy needs log",
                "callworker=plant_rubber_tree",
                "sleep=duration:10s"
            },
        },
        watering = {
            -- TRANSLATORS: Completed/Skipped/Did not start watering because ...
            descname = pgettext("europeans_building", "watering fields"),
            actions = {
                "callworker=check_growable_plants",
                "return=skipped unless site has water",
                "consume=water",
                "sleep=duration:1s",
                "callworker=watering"
            }
        },
        dummy = {
            -- just a dummy program to fix AI
            descname = "dummy program",
            actions = {
                "produce=balsa cotton ironwood liana reed rubber ore",
            },
        },
    },
}

pop_textdomain()
