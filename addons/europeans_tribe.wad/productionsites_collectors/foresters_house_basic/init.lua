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
                "call=plant_trees",
                "call=plant_trees_idle",
                "callworker=check_terraform_pond",
                "call=terraforming_pond",
                "return=skipped"
            }
        },
        terraforming_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming pond because ...
            descname = pgettext("europeans_building", "terraforming pond"),
            actions = {
                "callworker=terraform_pond"
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
    },
}

pop_textdomain()
