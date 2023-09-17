push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_medium_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Fruit Farm"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 54, 74 },
      },

    },
    spritesheets = {
      working = {
         fps = 20,
         frames = 5,
         columns = 5,
         rows = 1,
         hotspot = { 54, 74 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_farm_medium_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2
        },
    },

    aihints = {},

    working_positions = {
        europeans_farmer_normal = 1,
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
                "return=skipped unless site has water:4",
                "call=plant_idle",
                "call=plant_berrybush",
                "call=plant_reed",
                "call=harvest_berry",
                "call=harvest_reed",
                "return=skipped"
            }
        },
        plant_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs fruit or economy needs reed or economy needs water",
                "consume=water",
                "callworker=plant_reed",
                "animate=working duration:3s",
                "consume=water:2",
                "callworker=plant_berrybush",
                "animate=working duration:3s",
                "sleep=duration:30s"
            }
        },
        plant_berrybush = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting berrybush because ...
            descname = pgettext("europeans_building", "planting berrybush"),
            actions = {
                "return=skipped when economy needs reed and not economy needs fruit",
                "consume=water:2",
                "callworker=plant_berrybush",
                "animate=working duration:3s"
            }
        },
        plant_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = pgettext("europeans_building", "planting reed"),
            actions = {
                "return=skipped unless economy needs reed or workers need experience",
                "consume=water",
                "callworker=plant_reed",
                "animate=working duration:3s"
            }
        },
        harvest_berry = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting berry because ...
            descname = pgettext("europeans_building", "harvesting berry"),
            actions = {
                "return=skipped when economy needs reed and not economy needs fruit",
                "callworker=harvest_berrybush",
                "animate=working duration:3s",
                "produce=fruit"
            }
        },
        harvest_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = pgettext("europeans_building", "harvesting reed"),
            actions = {
                "return=skipped unless economy needs reed or workers need experience",
                "callworker=harvest_reed",
                "animate=working duration:3s",
                "produce=reed"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Fields"),
        heading = _("Out of Fields"),
        message = pgettext("europeans_building", "The farmer working at this fruit farm has no cleared soil to plant his seeds."),
        productivity_threshold = 30
    },
}

pop_textdomain()
