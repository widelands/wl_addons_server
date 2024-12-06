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
        name = "europeans_farm_small_advanced",
        enhancement_cost = {
            brick = 1,
            grout = 1,
            marble = 1,
            planks = 1,
            cloth = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            marble = 1
        }
    },
    buildcost = {
        granite = 2,
        log = 2,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 1,
        reed = 1
    },

    aihints = {
        space_consumer = true,
        basic_amount = 2,
        very_weak_ai_limit = 2,
        weak_ai_limit = 4,
        normal_ai_limit = 8,
    },

    working_positions = {
        europeans_gardener_basic = 1
    },
    
    inputs = {
        { name = "water", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=planting",
                "sleep=duration:2s",
                "call=planting",
                "sleep=duration:2s",
                "call=harvesting",
                "sleep=duration:2s",
                "call=harvesting",
                "return=skipped"
            }
        },
        planting = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting because ...
            descname = pgettext("europeans_building", "planting reed"),
            actions = {
                "sleep=duration:1s",
                "callworker=check_dig_space",
                "call=making_pond",
                "sleep=duration:1s",
                "call=planting_reed",
                "sleep=duration:1s",
                "call=making_pond",
                "sleep=duration:1s",
                "call=planting_reed"
            }
        },
        making_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start making pond because ...
            descname = pgettext("europeans_building", "making a pond with water"),
            actions = {
                "call=digging_clay",
                "sleep=duration:1s",
                "call=digging_pond",
                "sleep=duration:1s",
                "call=filling_pond"
            }
        },
        digging_clay = {
            -- TRANSLATORS: Completed/Skipped/Did not start digging clay because ...
            descname = pgettext("europeans_building", "digging clay"),
            actions = {
                "return=skipped unless economy needs clay or economy needs brick",
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
                "callworker=fill_pond_dry"
            }
        },
        planting_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = pgettext("europeans_building", "planting reed"),
            actions = {
                "callworker=check_pond_water",
                "animate=working duration:3s",
                "callworker=plant_reed"
            }
        },
        harvesting = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting because ...
            descname = pgettext("europeans_building", "harvesting"),
            actions = {
                "sleep=duration:2s",
                "callworker=check_fields",
                "call=harvesting_reed"
            }
        },
        harvesting_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = pgettext("europeans_building", "harvesting reed"),
            actions = {
                "callworker=harvest_reed",
                "produce=reed:2"
            }
        },
    },
}

pop_textdomain()
