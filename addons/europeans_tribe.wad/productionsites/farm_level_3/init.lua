push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_farm_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Farm Level 3"),
    icon = dirname .. "menu.png",
    size = "big",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 82, 74 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 82, 74 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_farmer_normal = 1,
        europeans_farmer_advanced = 2
    },
    
    inputs = {
        { name = "water", amount = 12 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=plant_berrybush",
                "call=plant_grape",
                "call=plant_blackroot",
                "call=plant_corn",
                "call=plant_wheat",
                "call=plant_rye",
                "call=plant_barley",
                "call=harvest_blackroot",
                "call=harvest_corn",
                "call=harvest_wheat",
                "call=harvest_rye",
                "call=harvest_barley",
                "call=harvest_berry",
                "call=harvest_grape",
                "return=skipped"
            }
        },
        plant_barley = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting barley because ...
            descname = _"planting barley",
            actions = {
                "return=skipped unless site has water:3",
                "consume=water",
                "callworker=plant_barley",
                "animate=working duration:4s",
                "sleep=duration:1s"
            }
        },
        plant_berrybush = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting berrybush because ...
            descname = _"planting berrybush",
            actions = {
                "return=skipped unless site has water:3",
                "consume=water:2",
                "callworker=plant_berrybush",
                "animate=working duration:4s",
                "sleep=duration:1s"
            }
        },
        plant_blackroot = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting blackroot because ...
            descname = _"planting blackroot",
            actions = {
                "return=skipped unless site has water:3",
                "consume=water",
                "callworker=plant_blackroot",
                "animate=working duration:4s",
                "sleep=duration:1s"
            }
        },
        plant_corn = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting corn because ...
            descname = _"planting corn",
            actions = {
                "return=skipped unless site has water:3",
                "consume=water",
                "callworker=plant_corn",
                "animate=working duration:4s",
                "sleep=duration:1s"
            }
        },
        plant_grape = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting grape because ...
            descname = _"planting grape",
            actions = {
                "return=skipped unless site has water:3",
                "consume=water:2",
                "callworker=plant_grape",
                "animate=working duration:4s",
                "sleep=duration:1s"
            }
        },
        plant_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting rye because ...
            descname = _"planting rye",
            actions = {
                "return=skipped unless site has water:3",
                "consume=water",
                "callworker=plant_rye",
                "animate=working duration:4s",
                "sleep=duration:1s"
            }
        },
        plant_wheat = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting wheat because ...
            descname = _"planting wheat",
            actions = {
                "return=skipped unless site has water:3",
                "consume=water",
                "callworker=plant_wheat",
                "animate=working duration:4s",
                "sleep=duration:1s"
            }
        },
        harvest_barley = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting barley because ...
            descname = _"harvesting barley",
            actions = {
                "return=skipped unless economy needs barley or workers need experience",
                "sleep=duration:4s",
                "callworker=harvest_barley",
                "animate=working duration:4s",
                "sleep=duration:1s",
                "produce=barley"
            }
        },
        harvest_berry = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting berry because ...
            descname = _"harvesting berry",
            actions = {
                "return=skipped unless economy needs fruit or workers need experience",
                "sleep=duration:4s",
                "callworker=harvest_berrybush",
                "animate=working duration:4s",
                "sleep=duration:1s",
                "produce=fruit"
            }
        },
        harvest_blackroot = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting blackroot because ...
            descname = _"harvesting blackroot",
            actions = {
                "return=skipped unless economy needs blackroot or workers need experience",
                "sleep=duration:4s",
                "callworker=harvest_blackroot",
                "animate=working duration:4s",
                "sleep=duration:1s",
                "produce=blackroot"
            }
        },
        harvest_corn = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting corn because ...
            descname = _"harvesting corn",
            actions = {
                "return=skipped unless economy needs corn or workers need experience",
                "sleep=duration:4s",
                "callworker=harvest_corn",
                "animate=working duration:4s",
                "sleep=duration:1s",
                "produce=corn"
            }
        },
        harvest_grape = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting grape because ...
            descname = _"harvesting grape",
            actions = {
                "return=skipped unless economy needs grape or workers need experience",
                "sleep=duration:4s",
                "callworker=harvest_grape",
                "animate=working duration:4s",
                "sleep=duration:1s",
                "produce=grape"
            }
        },
        harvest_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting rye because ...
            descname = _"harvesting rye",
            actions = {
                "return=skipped unless economy needs rye or workers need experience",
                "sleep=duration:4s",
                "callworker=harvest_rye",
                "animate=working duration:4s",
                "sleep=duration:1s",
                "produce=rye"
            }
        },
        harvest_wheat = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting wheat because ...
            descname = _"harvesting wheat",
            actions = {
                "return=skipped unless economy needs wheat or workers need experience",
                "sleep=duration:4s",
                "callworker=harvest_wheat",
                "animate=working duration:4s",
                "sleep=duration:1s",
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
