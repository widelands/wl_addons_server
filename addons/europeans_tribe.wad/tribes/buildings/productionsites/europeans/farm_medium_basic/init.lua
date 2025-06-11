push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/reed_yard/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_medium_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Reed Yard"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 46, 44 },
      },
      working = {
         basename = "idle",
         hotspot = { 46, 44 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_farm_medium_advanced",
        enhancement_cost = {
            brick = 2,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            granite = 2
        }
    },
    buildcost = {
        granite = 3,
        planks = 3
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2
    },

    aihints = {
        space_consumer = true,
        supports_seafaring = true,
        very_weak_ai_limit = 2,
        weak_ai_limit = 4,
        normal_ai_limit = 8
    },

    working_positions = {
        europeans_gardener_basic = 2
    },
    
    inputs = {
        { name = "water", amount = 4 },
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=planting",
                "sleep=duration:2s",
                "call=planting",
                "sleep=duration:2s",
                "call=harvesting",
                "sleep=duration:2s",
                "call=harvesting",
                "return=skipped"
            }
        },
        planting = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting because ...
            descname = pgettext("europeans_building", "planting"),
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
                "animate=working duration:3s",
                "produce=clay"
            }
        },
        digging_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start digging pond because ...
            descname = pgettext("europeans_building", "digging a dry pond"),
            actions = {
                "return=skipped when economy needs clay",
                "callworker=dig"
            }
        },
        filling_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start filling pond because ...
            descname = pgettext("europeans_building", "filling pond with water"),
            actions = {
                "callworker=check_pond_dry",
                "return=skipped unless site has water",
                "consume=water",
                "animate=working duration:3s",
                "callworker=fill_pond_dry"
            }
        },
        planting_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = pgettext("europeans_building", "planting reed"),
            actions = {
                "callworker=check_pond_water",
                "animate=working duration:3s",
                "callworker=plant_reed"
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
        harvesting_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = pgettext("europeans_building", "harvesting reed"),
            actions = {
                "return=skipped unless economy needs reed",
                "callworker=harvest_reed",
                "produce=reed:2"
            }
        },
        harvesting_cotton = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting cotton because ...
            descname = pgettext("europeans_building", "harvesting cotton"),
            actions = {
                "return=skipped unless economy needs cotton",
                "callworker=harvest_cotton",
                "produce=cotton:2"
            }
        },
        dummy_program = {
            -- TRANSLATORS: Completed/Skipped/Did not start dummy program because ...
            descname = _"dummy program",
            actions = {
                "sleep=duration:10s",
                "produce=fruit",
                "produce=grape"
            }
        }
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Fields",
        heading = _"Out of Fields",
        message = pgettext("europeans_building", "The gardener working at this reed yard has no cleared soil to plant his seeds."),
        productivity_threshold = 20
    },
}

pop_textdomain()
