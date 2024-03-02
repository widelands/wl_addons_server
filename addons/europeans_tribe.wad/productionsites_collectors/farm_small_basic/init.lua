push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_small_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Small Farm"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      unoccupied = {
         hotspot = { 44, 43 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 44, 43 }
      },
      idle = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 44, 43 }
      },
      working = {
         basename = "idle",
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 44, 43 }
      },
    },
    
    size = "small",
    enhancement = {
        name = "europeans_farm_small_normal",
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
        europeans_gardener_basic = 1
    },
    
    inputs = {
        { name = "water", amount = 6 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production_for_inputs",
                "call=making_pond",
                "sleep=duration:5s",
                "call=planting_reed",
                "sleep=duration:5s",
                "call=harvesting_reed",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has water:4",
                "sleep=duration:8m",
            }
        },
        making_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start making pond because ...
            descname = pgettext("europeans_building", "making a pond with water"),
            actions = {
                "callworker=check_dig",
                "call=digging_clay",
                "sleep=duration:5s",
                "call=digging_pond",
                "sleep=duration:5s",
                "call=filling_pond",
                "return=skipped"
            }
        },
        digging_clay = {
            -- TRANSLATORS: Completed/Skipped/Did not start digging clay because ...
            descname = pgettext("europeans_building", "digging clay"),
            actions = {
                "return=skipped unless economy needs clay",
                "callworker=check_dig",
                "callworker=dig",
                "return=skipped unless site has water",
                "consume=water",
                "animate=working duration:3s",
                "produce=clay"
            }
        },
        digging_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start digging pond because ...
            descname = pgettext("europeans_building", "digging a dry pond"),
            actions = {
                "return=skipped when economy needs clay",
                "callworker=check_dig",
                "callworker=dig"
            }
        },
        filling_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start filling pond because ...
            descname = pgettext("europeans_building", "filling pond with water"),
            actions = {
                "callworker=check_pond_dry",
                "return=skipped unless site has water",
                "consume=water",
                "animate=working duration:3s",
                "callworker=terraform_pond_dry"
            }
        },
        planting_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = pgettext("europeans_building", "planting reed"),
            actions = {
                "return=skipped unless economy needs reed",
                "callworker=check_pond_water",
                "animate=working duration:3s",
                "callworker=plant_reed"
            }
        },
        harvesting_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = pgettext("europeans_building", "harvesting reed"),
            actions = {
                "return=skipped unless economy needs reed",
                "callworker=harvest_reed",
                "produce=reed"
            }
        },
    },
}

pop_textdomain()
