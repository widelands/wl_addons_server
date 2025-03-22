push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/farm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Farm"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 89, 82 },
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 89, 82 },
      },
    },

    size = "big",
    
    aihints = {
        space_consumer = true,
        supports_seafaring = true,
        very_weak_ai_limit = 4,
        weak_ai_limit = 8,
        normal_ai_limit = 16,
    },

    working_positions = {
        europeans_farmer_advanced = 3
    },
    
    inputs = {
        { name = "water", amount = 16 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=planting",
                "sleep=duration:5s",
                "call=making_honey",
                "sleep=duration:5s",
                "call=watering",
                "sleep=duration:5s",
                "call=planting",
                "sleep=duration:5s",
                "call=making_honey",
                "sleep=duration:5s",
                "call=watering",
                "sleep=duration:5s",
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
                "call=plant_barley",
                "call=plant_rye",
                "call=plant_wheat",
                "call=plant_cotton",
                "call=plant_blackroot",
                "call=plant_corn",
                "call=plant_barley",
                "call=plant_rye",
                "call=plant_wheat",
                "call=plant_cotton",
                "call=plant_blackroot",
                "call=plant_corn",
            }
        },
        watering = {
            -- TRANSLATORS: Completed/Skipped/Did not start watering because ...
            descname = pgettext("europeans_building", "watering fields"),
            actions = {
                "sleep=duration:2s",
                "callworker=check_growable_plants",
                "return=skipped unless site has water",
                "consume=water",
                "callworker=watering"
            }
        },
        making_honey = {
            -- TRANSLATORS: Completed/Skipped/Did not start making honey because ...
            descname = pgettext("europeans_building", "making honey"),
            actions = {
                "return=skipped unless economy needs honey",
                "sleep=duration:2s",
                "callworker=check_flower",
                "callworker=bees",
                "produce=honey"
            }
        },
        harvesting = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting because ...
            descname = pgettext("europeans_building", "harvesting"),
            actions = {
                "sleep=duration:2s",
                "callworker=check_fields",
                "call=pausing_production_for_outputs",
                "call=harvest_cotton",
                "call=harvest_blackroot",
                "call=harvest_corn",
                "call=harvest_barley",
                "call=harvest_rye",
                "call=harvest_wheat",
                "call=harvest_cotton",
                "call=harvest_blackroot",
                "call=harvest_corn",
                "call=harvest_barley",
                "call=harvest_rye",
                "call=harvest_wheat"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has water:8",
                "sleep=duration:5m"
            }
        },
        pausing_production_for_outputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production because output not needed yet"),
            actions = {
                "return=skipped when economy needs barley",
                "return=skipped when economy needs blackroot",
                "return=skipped when economy needs corn",
                "return=skipped when economy needs cotton",
                "return=skipped when economy needs rye",
                "return=skipped when economy needs wheat",
                "sleep=duration:5m"
            }
        },
        plant_barley = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting barley because ...
            descname = pgettext("europeans_building", "planting barley"),
            actions = {
                "return=skipped when economy needs blackroot and not economy needs barley",
                "return=skipped when economy needs corn and not economy needs barley",
                "return=skipped when economy needs cotton and not economy needs barley",
                "return=skipped when economy needs rye and not economy needs barley",
                "return=skipped when economy needs wheat and not economy needs barley",
                "return=skipped unless site has water",
                "consume=water",
                "callworker=plant_barley",
                "animate=working duration:1s",
                "callworker=plant_barley",
                "animate=working duration:1s"
            }
        },
        plant_blackroot = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting blackroot because ...
            descname = pgettext("europeans_building", "planting blackroot"),
            actions = {
                "return=skipped when economy needs barley and not economy needs blackroot",
                "return=skipped when economy needs corn and not economy needs blackroot",
                "return=skipped when economy needs cotton and not economy needs blackroot",
                "return=skipped when economy needs rye and not economy needs blackroot",
                "return=skipped when economy needs wheat and not economy needs blackroot",
                "return=skipped unless site has water",
                "consume=water",
                "callworker=plant_blackroot",
                "animate=working duration:1s",
                "callworker=plant_blackroot",
                "animate=working duration:1s"
            }
        },
        plant_corn = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting corn because ...
            descname = pgettext("europeans_building", "planting corn"),
            actions = {
                "return=skipped when economy needs barley and not economy needs corn",
                "return=skipped when economy needs blackroot and not economy needs corn",
                "return=skipped when economy needs cotton and not economy needs corn",
                "return=skipped when economy needs rye and not economy needs corn",
                "return=skipped when economy needs wheat and not economy needs corn",
                "return=skipped unless site has water",
                "consume=water",
                "callworker=plant_corn",
                "animate=working duration:1s",
                "callworker=plant_corn",
                "animate=working duration:1s"
            }
        },
        plant_cotton = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting berrybush because ...
            descname = pgettext("europeans_building", "planting berry bushes"),
            actions = {
                "return=skipped when economy needs barley and not economy needs cotton",
                "return=skipped when economy needs blackroot and not economy needs cotton",
                "return=skipped when economy needs corn and not economy needs cotton",
                "return=skipped when economy needs rye and not economy needs cotton",
                "return=skipped when economy needs wheat and not economy needs cotton",
                "return=skipped unless site has water:2",
                "consume=water:2",
                "callworker=plant_cotton",
                "animate=working duration:1s",
                "callworker=plant_cotton",
                "animate=working duration:1s"
            }
        },
        plant_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting rye because ...
            descname = pgettext("europeans_building", "planting rye"),
            actions = {
                "return=skipped when economy needs barley and not economy needs rye",
                "return=skipped when economy needs blackroot and not economy needs rye",
                "return=skipped when economy needs corn and not economy needs rye",
                "return=skipped when economy needs cotton and not economy needs rye",
                "return=skipped when economy needs wheat and not economy needs rye",
                "return=skipped unless site has water",
                "consume=water",
                "callworker=plant_rye",
                "animate=working duration:1s",
                "callworker=plant_rye",
                "animate=working duration:1s"
            }
        },
        plant_wheat = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting wheat because ...
            descname = pgettext("europeans_building", "planting wheat"),
            actions = {
                "return=skipped when economy needs barley and not economy needs wheat",
                "return=skipped when economy needs blackroot and not economy needs wheat",
                "return=skipped when economy needs corn and not economy needs wheat",
                "return=skipped when economy needs cotton and not economy needs wheat",
                "return=skipped when economy needs rye and not economy needs wheat",
                "return=skipped unless site has water",
                "consume=water",
                "callworker=plant_wheat",
                "animate=working duration:1s",
                "callworker=plant_wheat",
                "animate=working duration:1s"
            }
        },
        harvest_barley = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting barley because ...
            descname = pgettext("europeans_building", "harvesting barley"),
            actions = {
                "return=skipped unless economy needs barley",
                "return=skipped when economy needs blackroot and not economy needs barley",
                "return=skipped when economy needs corn and not economy needs barley",
                "return=skipped when economy needs cotton and not economy needs barley",
                "return=skipped when economy needs rye and not economy needs barley",
                "return=skipped when economy needs wheat and not economy needs barley",
                "callworker=harvest_barley",
                "animate=working duration:1s",
                "produce=barley",
                "callworker=harvest_barley",
                "animate=working duration:1s",
                "produce=barley"
            }
        },
        harvest_blackroot = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting blackroot because ...
            descname = pgettext("europeans_building", "harvesting blackroot"),
            actions = {
                "return=skipped unless economy needs blackroot",
                "return=skipped when economy needs barley and not economy needs blackroot",
                "return=skipped when economy needs corn and not economy needs blackroot",
                "return=skipped when economy needs cotton and not economy needs blackroot",
                "return=skipped when economy needs rye and not economy needs blackroot",
                "return=skipped when economy needs wheat and not economy needs blackroot",
                "callworker=harvest_blackroot",
                "animate=working duration:1s",
                "produce=blackroot",
                "callworker=harvest_blackroot",
                "animate=working duration:1s",
                "produce=blackroot"
            }
        },
        harvest_corn = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting corn because ...
            descname = pgettext("europeans_building", "harvesting corn"),
            actions = {
                "return=skipped unless economy needs corn",
                "return=skipped when economy needs barley and not economy needs corn",
                "return=skipped when economy needs blackroot and not economy needs corn",
                "return=skipped when economy needs cotton and not economy needs corn",
                "return=skipped when economy needs rye and not economy needs corn",
                "return=skipped when economy needs wheat and not economy needs corn",
                "callworker=harvest_corn",
                "animate=working duration:1s",
                "produce=corn",
                "callworker=harvest_corn",
                "animate=working duration:1s",
                "produce=corn"
            }
        },
        harvest_cotton = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting berry because ...
            descname = pgettext("europeans_building", "harvesting berries"),
            actions = {
                "return=skipped unless economy needs cotton",
                "return=skipped when economy needs barley and not economy needs cotton",
                "return=skipped when economy needs blackroot and not economy needs cotton",
                "return=skipped when economy needs corn and not economy needs cotton",
                "return=skipped when economy needs rye and not economy needs cotton",
                "return=skipped when economy needs wheat and not economy needs cotton",
                "callworker=harvest_cotton",
                "animate=working duration:1s",
                "produce=cotton",
                "callworker=harvest_cotton",
                "animate=working duration:1s",
                "produce=cotton"
            }
        },
        harvest_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting rye because ...
            descname = pgettext("europeans_building", "harvesting rye"),
            actions = {
                "return=skipped unless economy needs rye",
                "return=skipped when economy needs barley and not economy needs rye",
                "return=skipped when economy needs blackroot and not economy needs rye",
                "return=skipped when economy needs corn and not economy needs rye",
                "return=skipped when economy needs cotton and not economy needs rye",
                "return=skipped when economy needs wheat and not economy needs rye",
                "callworker=harvest_rye",
                "animate=working duration:1s",
                "produce=rye",
                "callworker=harvest_rye",
                "animate=working duration:1s",
                "produce=rye"
            }
        },
        harvest_wheat = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting wheat because ...
            descname = pgettext("europeans_building", "harvesting wheat"),
            actions = {
                "return=skipped unless economy needs wheat",
                "return=skipped when economy needs barley and not economy needs wheat",
                "return=skipped when economy needs blackroot and not economy needs wheat",
                "return=skipped when economy needs corn and not economy needs wheat",
                "return=skipped when economy needs cotton and not economy needs wheat",
                "return=skipped when economy needs rye and not economy needs wheat",
                "callworker=harvest_wheat",
                "animate=working duration:1s",
                "produce=wheat",
                "callworker=harvest_wheat",
                "animate=working duration:1s",
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
