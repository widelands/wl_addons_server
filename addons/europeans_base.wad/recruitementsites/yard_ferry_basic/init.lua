push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_ferry_yard_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Ferry Yard"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 62, 48 },
      },
      unoccupied = {
         hotspot = { 62, 48 },
      },
      working = {
         hotspot = { 61, 47 },
      },
    },
    
    size = "medium",
    destructible = true,
    map_check = {"seafaring", "waterways"},
    
    enhancement = {
        name = "europeans_shipyard_advanced",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            planks = 2,
            marble = 2,
            marble_column = 1,
            quartz = 1,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2,
            quartz = 1,
            diamond = 1
        }
    },
    buildcost = {
        granite = 3,
        log = 3,
        planks = 3,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 5,
        granite = 3,
        quartz = 1,
        diamond = 1
    },

    aihints = {
        needs_water = true,
        shipyard = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 1,
    },

    working_positions = {
        europeans_shipwright_basic = 1
    },

    inputs = {
        { name = "planks", amount = 10 },
        { name = "blackwood", amount = 2 },
        { name = "rubber", amount = 2 },
        { name = "metal_alloy", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=ferry_construction",
                "sleep=duration:30s",
                "call=ship_construction",
                "return=completed"
            }
        },
        ferry_construction = {
            -- TRANSLATORS: Completed/Skipped/Did not start constructing a ferry because ...
            descname = pgettext("europeans_building", "constructing a ferry"),
            actions = {
                "return=skipped when economy needs planks and not economy needs europeans_ferry",
                "return=skipped when economy needs rubber and not economy needs europeans_ferry",
                "return=skipped when not site has planks:2",
                "return=skipped when not site has rubber",
                "callworker=buildferry_1",
                "consume=planks:2 rubber",
                "callworker=buildferry_2"
            }
        },
        ship_construction = {
            -- TRANSLATORS: Completed/Skipped/Did not start constructing a ship because ...
            descname = pgettext("europeans_building", "constructing a ship"),
            actions = {
                "return=skipped when economy needs blackwood",
                "return=skipped when economy needs planks",
                "return=skipped when economy needs metal_alloy",
                "call=ship_preparation",
                "sleep=duration:30s",
                "call=ship_build"
            }
        },
        ship_preparation = {
            descname = _"working",
            actions = {
                "callworker=check_space",
                "consume=planks",
                "animate=working duration:30s",
            }
        },
        ship_build = {
            -- TRANSLATORS: Completed/Skipped/Did not start constructing a ship because ...
            descname = pgettext("europeans_building", "constructing a ship"),
            actions = {
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail"
            }
        },
        ship = {
            -- TRANSLATORS: Completed/Skipped/Did not start constructing a ship because ...
            descname = pgettext("europeans_building", "constructing a ship"),
            actions = {
                "return=skipped when not site has blackwood",
                "return=skipped when not site has planks",
                "return=skipped when not site has rubber",
                "return=skipped when not site has metal_alloy",
                "animate=working duration:25s",
                "construct=europeans_shipconstruction worker:buildship radius:6",
            }
        },
    },
}

pop_textdomain()
