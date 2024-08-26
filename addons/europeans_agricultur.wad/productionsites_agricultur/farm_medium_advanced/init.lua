push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_medium_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Vineyard"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 59, 65 },
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 59, 65 },
      },
    },

    size = "medium",

    aihints = {
        space_consumer = true,
        supports_seafaring = true,
        very_weak_ai_limit = 2,
        weak_ai_limit = 4,
        normal_ai_limit = 8,
    },

    working_positions = {
        europeans_farmer_advanced = 1,
        europeans_farmer_basic = 1
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
                "sleep=duration:5s",
                "call=making_honey",
                "sleep=duration:5s",
                "call=planting",
                "sleep=duration:5s",
                "call=making_honey",
                "sleep=duration:10s",
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
                "call=plant_cotton",
                "call=plant_berrybush",
                "call=plant_grape",
                "call=plant_reed"
            }
        },
        making_honey = {
            -- TRANSLATORS: Completed/Skipped/Did not start making honey because ...
            descname = pgettext("europeans_building", "making honey"),
            actions = {
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
                "call=harvest_berry",
                "call=harvest_grape",
                "call=harvest_reed"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has water:6",
                "sleep=duration:5m"
            }
        },
        pausing_production_for_outputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production because output not needed yet"),
            actions = {
                "return=skipped when economy needs cotton",
                "return=skipped when economy needs fruit",
                "return=skipped when economy needs grape",
                "return=skipped when economy needs reed",
                "sleep=duration:10m"
            }
        },
        plant_cotton = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting cotton because ...
            descname = pgettext("europeans_building", "planting cotton"),
            actions = {
                "return=skipped when economy needs fruit and not economy needs cotton",
                "return=skipped when economy needs grape and not economy needs cotton",
                "return=skipped when economy needs reed and not economy needs cotton",
                "consume=water:2",
                "callworker=plant_cotton",
                "animate=working duration:1s"
            }
        },
        plant_berrybush = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting berrybush because ...
            descname = pgettext("europeans_building", "planting berry bushes"),
            actions = {
                "return=skipped when economy needs cotton and not economy needs fruit",
                "return=skipped when economy needs grape and not economy needs fruit",
                "return=skipped when economy needs reed and not economy needs fruit",
                "return=skipped unless site has water",
                "consume=water",
                "callworker=plant_berrybush",
                "animate=working duration:1s"
            }
        },
        plant_grape = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting grape because ...
            descname = pgettext("europeans_building", "planting grapes"),
            actions = {
                "return=skipped when economy needs cotton and not economy needs grape",
                "return=skipped when economy needs fruit and not economy needs grape",
                "return=skipped when economy needs reed and not economy needs grape",
                "return=skipped unless site has water:2",
                "consume=water:2",
                "callworker=plant_grape",
                "animate=working duration:1s"
            }
        },
        plant_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = pgettext("europeans_building", "planting reed"),
            actions = {
                "return=skipped when economy needs cotton and not economy needs reed",
                "return=skipped when economy needs fruit and not economy needs reed",
                "return=skipped when economy needs grape and not economy needs reed",
                "consume=water",
                "callworker=plant_reed",
                "animate=working duration:1s"
            }
        },
        harvest_cotton = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting cotton because ...
            descname = pgettext("europeans_building", "harvesting cotton"),
            actions = {
                "return=skipped when economy needs fruit and not economy needs cotton",
                "return=skipped when economy needs grape and not economy needs cotton",
                "return=skipped when economy needs reed and not economy needs cotton",
                "callworker=harvest_cotton",
                "animate=working duration:1s",
                "produce=cotton:3"
            }
        },
        harvest_berry = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting berry because ...
            descname = pgettext("europeans_building", "harvesting berries"),
            actions = {
                "return=skipped when economy needs cotton and not economy needs fruit",
                "return=skipped when economy needs grape and not economy needs fruit",
                "return=skipped when economy needs reed and not economy needs fruit",
                "callworker=harvest_berrybush",
                "animate=working duration:1s",
                "produce=fruit"
            }
        },
        harvest_grape = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting grape because ...
            descname = pgettext("europeans_building", "harvesting grapes"),
            actions = {
                "return=skipped when economy needs cotton and not economy needs grape",
                "return=skipped when economy needs fruit and not economy needs grape",
                "return=skipped when economy needs reed and not economy needs grape",
                "callworker=harvest_grape",
                "animate=working duration:1s",
                "produce=grape"
            }
        },
        harvest_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = pgettext("europeans_building", "harvesting reed"),
            actions = {
                "return=skipped when economy needs cotton and not economy needs reed",
                "return=skipped when economy needs fruit and not economy needs reed",
                "return=skipped when economy needs grape and not economy needs reed",
                "callworker=harvest_reed",
                "animate=working duration:1s",
                "produce=reed:3"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Fields"),
        heading = _("Out of Fields"),
        message = pgettext("europeans_building", "The farmer working at this vineyard has no cleared soil to plant his seeds."),
        productivity_threshold = 30
    },
}

pop_textdomain()
