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

    aihints = {},

    working_positions = {
        europeans_farmer_advanced = 1,
        europeans_farmer_basic = 1
    },
    
    inputs = {
        { name = "water", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "callworker=check_space",
                "call=plant_idle",
                "call=plant_berrybush",
                "call=plant_grape",
                "call=plant_reed",
                "call=harvest_berry",
                "call=harvest_grape",
                "call=harvest_reed",
                "return=skipped"
            }
        },
        plant_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs grape or economy needs fruit or economy needs reed",
                "return=skipped when economy needs water",
                "consume=water",
                "callworker=plant_grape",
                "animate=working duration:1s",
                "consume=water",
                "callworker=plant_berrybush",
                "animate=working duration:1s",
                "consume=water",
                "callworker=plant_reed",
                "animate=working duration:1s",
                "sleep=duration:60s"
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
                "animate=working duration:1s"
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
                "animate=working duration:1s"
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
                "animate=working duration:1s"
            }
        },
        harvest_berry = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting berry because ...
            descname = pgettext("europeans_building", "harvesting berry"),
            actions = {
                "return=skipped unless economy needs fruit or workers need experience",
                "callworker=harvest_berrybush",
                "animate=working duration:1s",
                "produce=fruit"
            }
        },
        harvest_grape = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting grape because ...
            descname = pgettext("europeans_building", "harvesting grape"),
            actions = {
                "return=skipped unless economy needs grape or workers need experience",
                "callworker=harvest_grape",
                "animate=working duration:1s",
                "produce=grape"
            }
        },
        harvest_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = pgettext("europeans_building", "harvesting reed"),
            actions = {
                "return=skipped unless economy needs reed or workers need experience",
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
