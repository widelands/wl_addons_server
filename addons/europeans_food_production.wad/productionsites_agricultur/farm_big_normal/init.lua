push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Farm"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 86, 78 },
      },
      working = {
         basename = "idle",
         hotspot = { 86, 78 },
      },
    },
    
    size = "big",
    enhancement = {
        name = "europeans_farm_advanced",
        enhancement_cost = {
            planks = 3,
            brick = 3,
            marble = 3
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            granite = 3,
            marble = 3
        }
    },

    aihints = {},

    working_positions = {
        europeans_farmer_normal = 2,
        europeans_farmer_basic = 1
    },

    inputs = {
        { name = "water", amount = 12 }
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=planting",
                "sleep=duration:10s",
                "call=making_honey",
                "sleep=duration:20s",
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
                "call=plant_reed",
                "call=plant_blackroot",
                "call=plant_corn",
                "call=plant_berrybush",
                "call=plant_barley",
                "call=plant_rye",
                "call=plant_wheat",
            }
        },
        making_honey = {
            -- TRANSLATORS: Completed/Skipped/Did not start making honey because ...
            descname = pgettext("europeans_building", "making honey"),
            actions = {
                "sleep=duration:2s",
                "callworker=check_flower",
                "callworker=bees",
            }
        },
        harvesting = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting because ...
            descname = pgettext("europeans_building", "harvesting"),
            actions = {
                "sleep=duration:2s",
                "callworker=check_fields",
                "call=pausing_production_for_outputs",
                "call=harvest_reed",
                "call=harvest_blackroot",
                "call=harvest_corn",
                "call=harvest_berry",
                "call=harvest_barley",
                "call=harvest_rye",
                "call=harvest_wheat",
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has water:6",
                "sleep=duration:5m",
            }
        },
        pausing_production_for_outputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production because output not needed yet"),
            actions = {
                "return=skipped when economy needs reed",
                "return=skipped when economy needs barley",
                "return=skipped when economy needs blackroot",
                "return=skipped when economy needs corn",
                "return=skipped when economy needs fruit",
                "return=skipped when economy needs rye",
                "return=skipped when economy needs wheat",
                "sleep=duration:10m",
            }
        },
        plant_barley = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting barley because ...
            descname = pgettext("europeans_building", "planting barley"),
            actions = {
                "return=skipped when economy needs blackroot and not economy needs barley",
                "return=skipped when economy needs corn and not economy needs barley",
                "return=skipped when economy needs fruit and not economy needs barley",
                "return=skipped when economy needs reed and not economy needs barley",
                "return=skipped when economy needs rye and not economy needs barley",
                "return=skipped when economy needs wheat and not economy needs barley",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_barley",
                "animate=working duration:4s",
                "consume=water",
                "callworker=plant_barley",
                "animate=working duration:4s"
            }
        },
        plant_berrybush = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting berrybush because ...
            descname = pgettext("europeans_building", "planting berrybush"),
            actions = {
                "return=skipped when economy needs barley and not economy needs fruit",
                "return=skipped when economy needs blackroot and not economy needs fruit",
                "return=skipped when economy needs corn and not economy needs fruit",
                "return=skipped when economy needs reed and not economy needs fruit",
                "return=skipped when economy needs rye and not economy needs fruit",
                "return=skipped when economy needs wheat and not economy needs fruit",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_berrybush",
                "animate=working duration:4s",
                "consume=water",
                "callworker=plant_berrybush",
                "animate=working duration:4s"
            }
        },
        plant_blackroot = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting blackroot because ...
            descname = pgettext("europeans_building", "planting blackroot"),
            actions = {
                "return=skipped when economy needs barley and not economy needs blackroot",
                "return=skipped when economy needs corn and not economy needs blackroot",
                "return=skipped when economy needs fruit and not economy needs blackroot",
                "return=skipped when economy needs reed and not economy needs blackroot",
                "return=skipped when economy needs rye and not economy needs blackroot",
                "return=skipped when economy needs wheat and not economy needs blackroot",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_blackroot",
                "animate=working duration:4s",
                "consume=water",
                "callworker=plant_blackroot",
                "animate=working duration:4s"
            }
        },
        plant_corn = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting corn because ...
            descname = pgettext("europeans_building", "planting corn"),
            actions = {
                "return=skipped when economy needs barley and not economy needs corn",
                "return=skipped when economy needs blackroot and not economy needs corn",
                "return=skipped when economy needs fruit and not economy needs corn",
                "return=skipped when economy needs reed and not economy needs corn",
                "return=skipped when economy needs rye and not economy needs corn",
                "return=skipped when economy needs wheat and not economy needs corn",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_corn",
                "animate=working duration:4s",
                "consume=water",
                "callworker=plant_corn",
                "animate=working duration:4s"
            }
        },
        plant_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = pgettext("europeans_building", "planting reed"),
            actions = {
                "return=skipped when economy needs barley and not economy needs reed",
                "return=skipped when economy needs blackroot and not economy needs reed",
                "return=skipped when economy needs corn and not economy needs reed",
                "return=skipped when economy needs fruit and not economy needs reed",
                "return=skipped when economy needs rye and not economy needs reed",
                "return=skipped when economy needs wheat and not economy needs reed",
                "consume=water",
                "callworker=plant_reed",
                "animate=working duration:4s",
                "consume=water",
                "callworker=plant_reed",
                "animate=working duration:4s"
            }
        },
        plant_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting rye because ...
            descname = pgettext("europeans_building", "planting rye"),
            actions = {
                "return=skipped when economy needs barley and not economy needs rye",
                "return=skipped when economy needs blackroot and not economy needs rye",
                "return=skipped when economy needs corn and not economy needs rye",
                "return=skipped when economy needs fruit and not economy needs rye",
                "return=skipped when economy needs reed and not economy needs rye",
                "return=skipped when economy needs wheat and not economy needs rye",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_rye",
                "animate=working duration:4s",
                "consume=water",
                "callworker=plant_rye",
                "animate=working duration:4s"
            }
        },
        plant_wheat = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting wheat because ...
            descname = pgettext("europeans_building", "planting wheat"),
            actions = {
                "return=skipped when economy needs barley and not economy needs wheat",
                "return=skipped when economy needs blackroot and not economy needs wheat",
                "return=skipped when economy needs corn and not economy needs wheat",
                "return=skipped when economy needs fruit and not economy needs wheat",
                "return=skipped when economy needs reed and not economy needs wheat",
                "return=skipped when economy needs rye and not economy needs wheat",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_wheat",
                "animate=working duration:4s",
                "consume=water",
                "callworker=plant_wheat",
                "animate=working duration:4s"
            }
        },
        harvest_barley = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting barley because ...
            descname = pgettext("europeans_building", "harvesting barley"),
            actions = {
                "return=skipped when economy needs blackroot and not economy needs barley",
                "return=skipped when economy needs corn and not economy needs barley",
                "return=skipped when economy needs fruit and not economy needs barley",
                "return=skipped when economy needs reed and not economy needs barley",
                "return=skipped when economy needs rye and not economy needs barley",
                "return=skipped when economy needs wheat and not economy needs barley",
                "callworker=harvest_barley",
                "animate=working duration:4s",
                "produce=barley",
                "callworker=harvest_barley",
                "animate=working duration:4s",
                "produce=barley"
            }
        },
        harvest_berry = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting berry because ...
            descname = pgettext("europeans_building", "harvesting berry"),
            actions = {
                "return=skipped when economy needs barley and not economy needs fruit",
                "return=skipped when economy needs blackroot and not economy needs fruit",
                "return=skipped when economy needs corn and not economy needs fruit",
                "return=skipped when economy needs reed and not economy needs fruit",
                "return=skipped when economy needs rye and not economy needs fruit",
                "return=skipped when economy needs wheat and not economy needs fruit",
                "callworker=harvest_berrybush",
                "animate=working duration:4s",
                "produce=fruit",
                "callworker=harvest_berrybush",
                "animate=working duration:4s",
                "produce=fruit"
            }
        },
        harvest_blackroot = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting blackroot because ...
            descname = pgettext("europeans_building", "harvesting blackroot"),
            actions = {
                "return=skipped when economy needs barley and not economy needs blackroot",
                "return=skipped when economy needs corn and not economy needs blackroot",
                "return=skipped when economy needs fruit and not economy needs blackroot",
                "return=skipped when economy needs reed and not economy needs blackroot",
                "return=skipped when economy needs rye and not economy needs blackroot",
                "return=skipped when economy needs wheat and not economy needs blackroot",
                "callworker=harvest_blackroot",
                "animate=working duration:4s",
                "produce=blackroot",
                "callworker=harvest_blackroot",
                "animate=working duration:4s",
                "produce=blackroot"
            }
        },
        harvest_corn = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting corn because ...
            descname = pgettext("europeans_building", "harvesting corn"),
            actions = {
                "return=skipped when economy needs barley and not economy needs corn",
                "return=skipped when economy needs blackroot and not economy needs corn",
                "return=skipped when economy needs fruit and not economy needs corn",
                "return=skipped when economy needs reed and not economy needs corn",
                "return=skipped when economy needs rye and not economy needs corn",
                "return=skipped when economy needs wheat and not economy needs corn",
                "callworker=harvest_corn",
                "animate=working duration:4s",
                "produce=corn",
                "callworker=harvest_corn",
                "animate=working duration:4s",
                "produce=corn"
            }
        },
        harvest_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = pgettext("europeans_building", "harvesting reed"),
            actions = {
                "return=skipped when economy needs barley and not economy needs reed",
                "return=skipped when economy needs blackroot and not economy needs reed",
                "return=skipped when economy needs corn and not economy needs reed",
                "return=skipped when economy needs fruit and not economy needs reed",
                "return=skipped when economy needs rye and not economy needs reed",
                "return=skipped when economy needs wheat and not economy needs reed",
                "callworker=harvest_reed",
                "animate=working duration:4s",
                "produce=reed",
                "callworker=harvest_reed",
                "animate=working duration:4s",
                "produce=reed"
            }
        },
        harvest_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting rye because ...
            descname = pgettext("europeans_building", "harvesting rye"),
            actions = {
                "return=skipped when economy needs barley and not economy needs rye",
                "return=skipped when economy needs blackroot and not economy needs rye",
                "return=skipped when economy needs corn and not economy needs rye",
                "return=skipped when economy needs fruit and not economy needs rye",
                "return=skipped when economy needs reed and not economy needs rye",
                "return=skipped when economy needs wheat and not economy needs rye",
                "callworker=harvest_rye",
                "animate=working duration:4s",
                "produce=rye",
                "callworker=harvest_rye",
                "animate=working duration:4s",
                "produce=rye"
            }
        },
        harvest_wheat = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting wheat because ...
            descname = pgettext("europeans_building", "harvesting wheat"),
            actions = {
                "return=skipped when economy needs barley and not economy needs wheat",
                "return=skipped when economy needs blackroot and not economy needs wheat",
                "return=skipped when economy needs corn and not economy needs wheat",
                "return=skipped when economy needs fruit and not economy needs wheat",
                "return=skipped when economy needs reed and not economy needs wheat",
                "return=skipped when economy needs rye and not economy needs wheat",
                "callworker=harvest_wheat",
                "animate=working duration:4s",
                "produce=wheat",
                "callworker=harvest_wheat",
                "animate=working duration:4s",
                "produce=wheat"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Fields",
        heading = _"Out of Fields",
        message = pgettext("europeans_building", "The farmer working at this farm has no cleared soil to plant his seeds."),
        productivity_threshold = 30
    },
}

pop_textdomain()
