push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_medium_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Fruit Farm"),
    icon = dirname .. "menu.png",
    size = "medium",
    
    enhancement = {
        name = "europeans_farm_medium_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            grout = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            log = 2,
            granite = 2,
            marble = 2
        },
    },

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

    aihints = {},

    working_positions = {
        europeans_farmer_normal = 1
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
                "call=plant_reed",
                "call=harvest_berry",
                "call=harvest_reed",
                "call=plant_fruit_idle",
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
                "callworker=plant_berrybush"
            }
        },
        plant_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = pgettext("europeans_building", "planting reed"),
            actions = {
                "return=skipped unless economy needs reed or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_reed"
            }
        },
        harvest_berry = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting berry because ...
            descname = pgettext("europeans_building", "harvesting berry"),
            actions = {
                "return=skipped unless economy needs fruit or workers need experience",
                "callworker=harvest_berrybush",
                "produce=fruit"
            }
        },
        harvest_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = pgettext("europeans_building", "harvesting reed"),
            actions = {
                "return=skipped unless economy needs reed or workers need experience",
                "callworker=harvest_reed",
                "produce=reed"
            }
        },
        plant_fruit_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs fruit or economy needs reed",
                "return=skipped when economy needs water",
                "consume=water:2",
                "callworker=plant_berrybush",
                "sleep=duration:60s"
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
