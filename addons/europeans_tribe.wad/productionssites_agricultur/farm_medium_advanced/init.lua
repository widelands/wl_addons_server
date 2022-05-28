push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_medium_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Vineyard"),
    icon = dirname .. "menu.png",
    size = "medium",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 59, 65 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_farmer_advanced = 1
    },
    
    inputs = {
        { name = "water", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=plant_berrybush",
                "call=plant_grape",
                "call=plant_reed",
                "call=harvest_berry",
                "call=harvest_grape",
                "call=harvest_reed",
                "call=plant_grape_idles",
                "return=skipped"
            }
        },
        plant_berrybush = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting berrybush because ...
            descname = pgettext("europeans_building", "planting berrybush"),
            actions = {
                "return=skipped unless economy needs fruit or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water:2",
                "callworker=plant_berrybush",
                "sleep=duration:1s"
            }
        },
        plant_grape = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting grape because ...
            descname = pgettext("europeans_building", "planting grape"),
            actions = {
                "return=skipped unless economy needs grape or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water:2",
                "callworker=plant_grape",
                "sleep=duration:1s"
            }
        },
        plant_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = pgettext("europeans_building", "planting reed"),
            actions = {
                "return=skipped unless economy needs reed or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_reed",
                "sleep=duration:1s"
            }
        },
        harvest_berry = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting berry because ...
            descname = pgettext("europeans_building", "harvesting berry"),
            actions = {
                "return=skipped unless economy needs fruit or workers need experience",
                "sleep=duration:3s",
                "callworker=harvest_berrybush",
                "sleep=duration:3s",
                "produce=fruit"
            }
        },
        harvest_grape = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting grape because ...
            descname = pgettext("europeans_building", "harvesting grape"),
            actions = {
                "return=skipped unless economy needs grape or workers need experience",
                "sleep=duration:3s",
                "callworker=harvest_grape",
                "sleep=duration:3s",
                "produce=grape"
            }
        },
        harvest_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = pgettext("europeans_building", "harvesting reed"),
            actions = {
                "return=skipped unless economy needs reed or workers need experience",
                "callworker=harvest_reed",
                "sleep=duration:3s",
                "produce=reed"
            }
        },
        plant_grape_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs grape or economy needs fruit or economy needs reed",
                "return=skipped when economy needs water",
                "consume=water:2",
                "callworker=plant_grape",
                "sleep=duration:60s"
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
