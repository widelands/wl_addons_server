push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
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
        basic_amount = 2,
        forced_after = 10
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
                "call=plant_reed",
                "call=harvest_reed",
                "call=plant_reed_idle",
                "return=skipped"
            }
        },
        plant_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = _"planting reed",
            actions = {
                "return=skipped unless economy needs reed or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_reed",
                "sleep=duration:4s"
            }
        },
        harvest_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = _"harvesting reed",
            actions = {
                "return=skipped unless economy needs reed or workers need experience",
                "callworker=harvest_reed",
                "sleep=duration:2s"
            }
        },
        plant_reed_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs reed",
                "return=skipped when economy needs water",
                "consume=water",
                "callworker=plant_reed",
                "sleep=duration:60s"
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
