push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Farm Level 1"),
    icon = dirname .. "menu.png",
    size = "big",
    
    enhancement = {
        name = "europeans_farm_level_2",
        enhancement_cost = {
            blackwood = 3,
            cloth = 3
        },
        enhancement_return_on_dismantle = {
            blackwood = 2
        },
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

    aihints = {
        space_consumer = true
    },

    working_positions = {
        europeans_farmer_normal = 2,
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
                "call=plant_idle",
                "call=plant_corn",
                "call=plant_barley",
                "call=plant_rye",
                "call=plant_wheat",
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
                "return=skipped when economy needs barley or economy needs rye or economy needs wheat or economy needs corn",
                "return=skipped when economy needs water",
                "consume=water:4",
                "callworker=plant_barley",
                "animate=working duration:6s",
                "callworker=plant_rye",
                "animate=working duration:6s",
                "callworker=plant_wheat",
                "animate=working duration:6s",
                "callworker=plant_corn",
                "animate=working duration:6s",
                "sleep=duration:15s"
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
                "animate=working duration:6s",
                "sleep=duration:3s",
                "consume=water",
                "callworker=plant_barley",
                "animate=working duration:6s",
                "sleep=duration:3s"
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
                "animate=working duration:6s",
                "sleep=duration:3s",
                "consume=water",
                "callworker=plant_corn",
                "animate=working duration:6s",
                "sleep=duration:3s"
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
                "animate=working duration:6s",
                "sleep=duration:3s",
                "consume=water",
                "callworker=plant_rye",
                "animate=working duration:6s",
                "sleep=duration:3s"
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
                "animate=working duration:6s",
                "sleep=duration:3s",
                "consume=water",
                "callworker=plant_wheat",
                "animate=working duration:6s",
                "sleep=duration:3s"
            }
        },
        harvest_barley = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting barley because ...
            descname = pgettext("europeans_building", "harvesting barley"),
            actions = {
                "return=skipped unless economy needs barley or workers need experience",
                "sleep=duration:6s",
                "callworker=harvest_barley",
                "animate=working duration:6s",
                "sleep=duration:3s",
                "produce=barley",
                "sleep=duration:6s",
                "callworker=harvest_barley",
                "animate=working duration:6s",
                "sleep=duration:3s",
                "produce=barley"
            }
        },
        harvest_corn = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting corn because ...
            descname = pgettext("europeans_building", "harvesting corn"),
            actions = {
                "return=skipped unless economy needs corn or workers need experience",
                "sleep=duration:6s",
                "callworker=harvest_corn",
                "animate=working duration:6s",
                "sleep=duration:3s",
                "produce=corn",
                "sleep=duration:6s",
                "callworker=harvest_corn",
                "animate=working duration:6s",
                "sleep=duration:3s",
                "produce=corn"
            }
        },
        harvest_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting rye because ...
            descname = pgettext("europeans_building", "harvesting rye"),
            actions = {
                "return=skipped unless economy needs rye or workers need experience",
                "sleep=duration:6s",
                "callworker=harvest_rye",
                "animate=working duration:6s",
                "sleep=duration:3s",
                "produce=rye",
                "sleep=duration:6s",
                "callworker=harvest_rye",
                "animate=working duration:6s",
                "sleep=duration:3s",
                "produce=rye"
            }
        },
        harvest_wheat = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting wheat because ...
            descname = pgettext("europeans_building", "harvesting wheat"),
            actions = {
                "return=skipped unless economy needs wheat or workers need experience",
                "sleep=duration:6s",
                "callworker=harvest_wheat",
                "animate=working duration:6s",
                "sleep=duration:3s",
                "produce=wheat",
                "sleep=duration:6s",
                "callworker=harvest_wheat",
                "animate=working duration:6s",
                "sleep=duration:3s",
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
