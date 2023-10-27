push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_foresters_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Ranger’s Hut"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      unoccupied = {
         hotspot = { 45, 49 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 45, 49 }
      },
      idle = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 45, 49 }
      },
    },
    
    size = "small",
    enhancement = {
        name = "europeans_foresters_house_normal",
        enhancement_cost = {
            blackwood = 1,
            cloth = 1,
            grout = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1
        },
    },
    buildcost = {
        log = 2,
        reed = 2,
        granite = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 1
    },

    aihints = {
        space_consumer = true,
        basic_amount = 4
    },

    working_positions = {
        europeans_forester_basic = 1
    },
    
    inputs = {
        { name = "water", amount = 4 },
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "callworker=check_space",
                "call=pausing_production_for_inputs",
                "call=plant_trees",
                "sleep=duration:10s",
                "callworker=check_pond_water",
                "call=planting_pond_water",
                "sleep=duration:10s",
                "callworker=check_pond_dry",
                "call=planting_pond_dry",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has water:2",
                "sleep=duration:15m",
            }
        },
        plant_trees = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting trees because ...
            descname = pgettext("europeans_building", "planting trees"),
            actions = {
                "return=skipped when economy needs water and not economy needs log",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant",
                "consume=water",
                "callworker=plant"
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
