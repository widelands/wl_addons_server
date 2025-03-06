push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/reed_yard/"

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
            grout = 2,
            planks = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 1
        }
    },
    buildcost = {
        granite = 3,
        log = 3,
        reed = 3
    },
    return_on_dismantle = {
        scrap_wood = 3,
        reed = 3,
        granite = 2
    },

    aihints = {
        space_consumer = true,
        supports_seafaring = true,
        basic_amount = 1,
        very_weak_ai_limit = 2,
        weak_ai_limit = 4,
        normal_ai_limit = 8,
    },

    working_positions = {
        europeans_farmer_basic = 1
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
                "sleep=duration:15s",
                "call=planting",
                "sleep=duration:15s",
                "call=harvesting",
                "return=skipped"
            }
        },
        planting = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting because ...
            descname = pgettext("europeans_building", "planting"),
            actions = {
                "sleep=duration:2s",
                "callworker=check_space",
                "call=pausing_production_for_inputs",
                "call=plant_reed"
            }
        },
        harvesting = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting because ...
            descname = pgettext("europeans_building", "harvesting"),
            actions = {
                "sleep=duration:2s",
                "callworker=check_fields",
                "call=pausing_production_for_outputs",
                "call=harvest_reed"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has water:2",
                "sleep=duration:5m"
            }
        },
        pausing_production_for_outputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production because output not needed yet"),
            actions = {
                "return=skipped when economy needs reed",
                "sleep=duration:10m"
            }
        },
        plant_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = pgettext("europeans_building", "planting reed"),
            actions = {
                "consume=water",
                "callworker=plant_reed",
                "animate=working duration:5s"
            }
        },
        harvest_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = pgettext("europeans_building", "harvesting reed"),
            actions = {
                "callworker=harvest_reed",
                "animate=working duration:5s",
                "produce=reed"
            }
        },
        dummy_program = {
            -- TRANSLATORS: Completed/Skipped/Did not start dummy program because ...
            descname = _"dummy program",
            actions = {
                "sleep=duration:10s",
                "produce=grape",
                "produce=fruit"
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
