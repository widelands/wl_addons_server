push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Farm Level 2"),
    icon = dirname .. "menu.png",
    size = "big",
    
    enhancement = {
        name = "europeans_farm_level_3",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            grout = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            granite = 1,
            marble = 1
        }
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 74, 60 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 74, 60 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_farmer_normal = 3
    },

    inputs = {
        { name = "water", amount = 10 }
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=plant_idle",
                "call=plant_blackroot",
                "call=plant_corn",
                "call=plant_barley",
                "call=plant_rye",
                "call=plant_wheat",
                "call=harvest_blackroot",
                "call=harvest_corn",
                "call=harvest_barley",
                "call=harvest_rye",
                "call=harvest_wheat",
                "return=skipped"
            }
        },
        plant_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs barley or economy needs rye or economy needs wheat or economy needs corn or economy needs blackroot",
                "return=skipped when economy needs water",
                "consume=water:5",
                "callworker=plant_barley",
                "animate=working duration:5s",
                "callworker=plant_rye",
                "animate=working duration:5s",
                "callworker=plant_wheat",
                "animate=working duration:5s",
                "callworker=plant_corn",
                "animate=working duration:5s",
                "callworker=plant_blackroot",
                "animate=working duration:5s",
                "sleep=duration:30s"
            }
        },
        plant_barley = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting barley because ...
            descname = pgettext("europeans_building", "planting barley"),
            actions = {
                "return=skipped unless economy needs barley or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_barley",
                "animate=working duration:5s",
                "consume=water",
                "callworker=plant_barley",
                "animate=working duration:5s"
            }
        },
        plant_blackroot = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting blackroot because ...
            descname = pgettext("europeans_building", "planting blackroot"),
            actions = {
                "return=skipped unless economy needs blackroot or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_blackroot",
                "animate=working duration:5s",
                "consume=water",
                "callworker=plant_blackroot",
                "animate=working duration:5s"
            }
        },
        plant_corn = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting corn because ...
            descname = pgettext("europeans_building", "planting corn"),
            actions = {
                "return=skipped unless economy needs corn or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_corn",
                "animate=working duration:5s",
                "consume=water",
                "callworker=plant_corn",
                "animate=working duration:5s"
            }
        },
        plant_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting rye because ...
            descname = pgettext("europeans_building", "planting rye"),
            actions = {
                "return=skipped unless economy needs rye or workers need experience",
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
                "return=skipped unless economy needs wheat or workers need experience",
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
                "return=skipped unless economy needs barley or workers need experience",
                "callworker=harvest_barley",
                "animate=working duration:5s",
                "produce=barley",
                "callworker=harvest_barley",
                "animate=working duration:5s",
                "produce=barley"
            }
        },
        harvest_blackroot = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting blackroot because ...
            descname = pgettext("europeans_building", "harvesting blackroot"),
            actions = {
                "return=skipped unless economy needs blackroot or workers need experience",
                "callworker=harvest_blackroot",
                "animate=working duration:5s",
                "produce=blackroot",
                "callworker=harvest_blackroot",
                "animate=working duration:5s",
                "produce=blackroot"
            }
        },
        harvest_corn = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting corn because ...
            descname = pgettext("europeans_building", "harvesting corn"),
            actions = {
                "return=skipped unless economy needs corn or workers need experience",
                "callworker=harvest_corn",
                "animate=working duration:5s",
                "produce=corn",
                "callworker=harvest_corn",
                "animate=working duration:5s",
                "produce=corn"
            }
        },
        harvest_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting rye because ...
            descname = pgettext("europeans_building", "harvesting rye"),
            actions = {
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
