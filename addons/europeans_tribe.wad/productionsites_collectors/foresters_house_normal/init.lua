push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_foresters_house_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Forester’s House"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 39, 47 },
      }
    },
    
    size = "small",
    enhancement = {
        name = "europeans_foresters_house_advanced",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            marble = 1
        },
    },

    aihints = {},

    working_positions = {
        europeans_forester_normal = 1
    },

    inputs = {
        { name = "water", amount = 6 },
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "callworker=check_space",
                "call=plant_trees",
                "call=plant_trees_idle",
                "callworker=check_pond_water",
                "call=planting_pond_water",
                "callworker=check_pond_dry",
                "call=planting_pond_dry",
                "return=skipped"
            }
        },
        plant_trees = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting trees because ...
            descname = pgettext("europeans_building", "planting trees"),
            actions = {
                "return=skipped when economy needs water and not economy needs log",
                "return=skipped unless site has water:3",
                "consume=water",
                "callworker=plant",
                "consume=water",
                "callworker=plant",
                "consume=water",
                "callworker=plant"
            }
        },
        plant_trees_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs log",
                "return=skipped when economy needs water",
                "consume=water",
                "callworker=plant",
                "sleep=duration:60s"
            }
        },
        planting_pond_water = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting trees in pond with water because ...
            descname = pgettext("europeans_building", "planting trees in pond with water"),
            actions = {
                "callworker=terraform_pond_water",
                "return=skipped"
            }
        },
        planting_pond_dry = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting trees in dry pond because ...
            descname = pgettext("europeans_building", "planting trees in dry pond"),
            actions = {
                "return=skipped when economy needs water",
                "return=skipped unless site has water",
                "consume=water",
                "callworker=terraform_pond_dry",
                "return=skipped"
            }
        },
    },
}

pop_textdomain()
