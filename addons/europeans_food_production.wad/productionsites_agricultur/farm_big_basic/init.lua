push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Farm"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      unoccupied = {
         hotspot = { 69, 76 },
      },
    },
    spritesheets = {
      idle = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 69, 76 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 69, 76 }
      },
      working = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 69, 76 }
      },
    },
    
    size = "big",
    enhancement = {
        name = "europeans_farm_normal",
        enhancement_cost = {
            blackwood = 3,
            cloth = 3,
            grout = 3
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            granite = 3,
        },
    },
    buildcost = {
        log = 4,
        reed = 4,
        granite = 3
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 2
    },

    aihints = {
        space_consumer = true,
        supports_seafaring = true,
        basic_amount = 4
    },

    working_positions = {
        europeans_farmer_basic = 2
    },
    
    inputs = {
        { name = "water", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=planting",
                "call=harvesting",
                "return=skipped"
            }
        },
        planting = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting because ...
            descname = pgettext("europeans_building", "planting"),
            actions = {
                "callworker=check_space",
                "call=pausing_production_for_inputs",
                "call=plant_reed",
                "call=plant_barley",
                "call=plant_reed",
                "call=plant_rye",
                "call=plant_reed",
                "call=plant_wheat",
            }
        },
        harvesting = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting because ...
            descname = pgettext("europeans_building", "harvesting"),
            actions = {
                "callworker=check_fields",
                "call=pausing_production_for_outputs",
                "call=harvest_reed",
                "call=harvest_barley",
                "call=harvest_reed",
                "call=harvest_rye",
                "call=harvest_reed",
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
                "return=skipped when economy needs rye",
                "return=skipped when economy needs wheat",
                "sleep=duration:10m",
            }
        },
        plant_barley = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting barley because ...
            descname = pgettext("europeans_building", "planting barley"),
            actions = {
                "return=skipped when economy needs reed and not economy needs barley",
                "return=skipped when economy needs rye and not economy needs barley",
                "return=skipped when economy needs wheat and not economy needs barley",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_barley",
                "animate=working duration:5s",
                "consume=water",
                "callworker=plant_barley",
                "animate=working duration:5s"
            }
        },
        plant_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = pgettext("europeans_building", "planting reed"),
            actions = {
                "return=skipped when economy needs barley and not economy needs reed",
                "return=skipped when economy needs rye and not economy needs reed",
                "return=skipped when economy needs wheat and not economy needs reed",
                "consume=water",
                "callworker=plant_reed",
                "animate=working duration:5s",
                "consume=water",
                "callworker=plant_reed",
                "animate=working duration:5s"
            }
        },
        plant_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting rye because ...
            descname = pgettext("europeans_building", "planting rye"),
            actions = {
                "return=skipped when economy needs barley and not economy needs rye",
                "return=skipped when economy needs reed and not economy needs rye",
                "return=skipped when economy needs wheat and not economy needs rye",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_rye",
                "animate=working duration:5s",
                "consume=water",
                "callworker=plant_rye",
                "animate=working duration:5s"
            }
        },
        plant_wheat = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting wheat because ...
            descname = pgettext("europeans_building", "planting wheat"),
            actions = {
                "return=skipped when economy needs barley and not economy needs wheat",
                "return=skipped when economy needs reed and not economy needs wheat",
                "return=skipped when economy needs rye and not economy needs wheat",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_wheat",
                "animate=working duration:5s",
                "consume=water",
                "callworker=plant_wheat",
                "animate=working duration:5s"
            }
        },
        harvest_barley = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting barley because ...
            descname = pgettext("europeans_building", "harvesting barley"),
            actions = {
                "return=skipped when economy needs reed and not economy needs barley",
                "return=skipped when economy needs rye and not economy needs barley",
                "return=skipped when economy needs wheat and not economy needs barley",
                "return=skipped unless economy needs barley or workers need experience",
                "callworker=harvest_barley",
                "animate=working duration:5s",
                "produce=barley",
                "callworker=harvest_barley",
                "animate=working duration:5s",
                "produce=barley"
            }
        },
        harvest_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = pgettext("europeans_building", "harvesting reed"),
            actions = {
                "return=skipped when economy needs barley and not economy needs reed",
                "return=skipped when economy needs rye and not economy needs reed",
                "return=skipped when economy needs wheat and not economy needs reed",
                "callworker=harvest_reed",
                "animate=working duration:5s",
                "produce=reed",
                "callworker=harvest_reed",
                "animate=working duration:5s",
                "produce=reed"
            }
        },
        harvest_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting rye because ...
            descname = pgettext("europeans_building", "harvesting rye"),
            actions = {
                "return=skipped when economy needs barley and not economy needs rye",
                "return=skipped when economy needs reed and not economy needs rye",
                "return=skipped when economy needs wheat and not economy needs rye",
                "return=skipped unless economy needs rye or workers need experience",
                "callworker=harvest_rye",
                "animate=working duration:5s",
                "produce=rye",
                "callworker=harvest_rye",
                "animate=working duration:5s",
                "produce=rye"
            }
        },
        harvest_wheat = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting wheat because ...
            descname = pgettext("europeans_building", "harvesting wheat"),
            actions = {
                "return=skipped when economy needs barley and not economy needs wheat",
                "return=skipped when economy needs reed and not economy needs wheat",
                "return=skipped when economy needs rye and not economy needs wheat",
                "return=skipped unless economy needs wheat or workers need experience",
                "callworker=harvest_wheat",
                "animate=working duration:5s",
                "produce=wheat",
                "callworker=harvest_wheat",
                "animate=working duration:5s",
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
