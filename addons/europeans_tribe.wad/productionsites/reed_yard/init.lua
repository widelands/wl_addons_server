push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_reed_yard",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Reed Yard"),
    icon = dirname .. "menu.png",
    size = "medium",

    buildcost = {
        log = 3,
        reed = 3,
        granite = 2
    },
    return_on_dismantle = {
        log = 2,
        reed = 3,
        granite = 1
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 46, 44 },
        },
    },

    aihints = {
        space_consumer = true,
        supports_seafaring = true,
        basic_amount = 4,
        forced_after = 900
    },

    working_positions = {
        europeans_farmer_basic = 1
    },
    
    inputs = {
        { name = "water", amount = 6},
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=plant",
                "call=harvest",
                "return=skipped"
            }
        },
        plant = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = _"planting reed",
            actions = {
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_reed",
                "sleep=duration:4s"
            }
        },
        harvest = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = _"harvesting reed",
            actions = {
                "return=skipped unless economy needs reed or workers need experience",
                "callworker=harvest_reed",
                "sleep=duration:2s"
            }
        },
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
