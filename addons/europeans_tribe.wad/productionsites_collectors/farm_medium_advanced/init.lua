push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_medium_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Rubber Farm"),
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

    aihints = {},

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
                "callworker=check_space",
                "return=skipped unless site has water:6",
                "call=plant_idle",
                "call=plant_cotton",
                "call=plant_rubber",
                "call=plant_reed",
                "call=harvest_cotton",
                "call=harvest_rubber",
                "call=harvest_reed",
                "return=skipped"
            }
        },
        plant_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs cotton or economy needs rubber or economy needs reed or economy needs water",
                "consume=water",
                "callworker=plant_reed",
                "animate=working duration:1s",
                "consume=water:2",
                "callworker=plant_cotton",
                "animate=working duration:1s",
                "consume=water:2",
                "callworker=plant_rubber",
                "animate=working duration:1s",
                "sleep=duration:30s"
            }
        },
        plant_cotton = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting cotton because ...
            descname = pgettext("europeans_building", "planting cotton"),
            actions = {
                "return=skipped when economy needs rubber and not economy needs cotton",
                "return=skipped when economy needs reed and not economy needs cotton",
                "consume=water:2",
                "callworker=plant_cotton",
                "animate=working duration:1s"
            }
        },
        plant_rubber = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting rubber because ...
            descname = pgettext("europeans_building", "planting rubber"),
            actions = {
                "return=skipped when economy needs cotton and not economy needs rubber",
                "return=skipped when economy needs reed and not economy needs rubber",
                "consume=water:2",
                "callworker=plant_rubber",
                "animate=working duration:1s",
            }
        },
        plant_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = pgettext("europeans_building", "planting reed"),
            actions = {
                "return=skipped when economy needs cotton and not economy needs reed",
                "return=skipped when economy needs rubber and not economy needs reed",
                "consume=water",
                "callworker=plant_reed",
                "animate=working duration:1s",
            }
        },
        harvest_cotton = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting cotton because ...
            descname = pgettext("europeans_building", "harvesting cotton"),
            actions = {
                "return=skipped when economy needs rubber and not economy needs cotton",
                "return=skipped when economy needs reed and not economy needs cotton",
                "callworker=harvest_cotton",
                "animate=working duration:1s",
                "produce=cotton"
            }
        },
        harvest_rubber = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting rubber because ...
            descname = pgettext("europeans_building", "harvesting rubber"),
            actions = {
                "return=skipped when economy needs cotton and not economy needs rubber",
                "return=skipped when economy needs reed and not economy needs rubber",
                "callworker=harvest_rubber",
                "animate=working duration:1s",
                "produce=rubber"
            }
        },
        harvest_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = pgettext("europeans_building", "harvesting reed"),
            actions = {
                "return=skipped when economy needs cotton and not economy needs reed",
                "return=skipped when economy needs rubber and not economy needs reed",
                "callworker=harvest_reed",
                "animate=working duration:1s",
                "produce=reed"
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
