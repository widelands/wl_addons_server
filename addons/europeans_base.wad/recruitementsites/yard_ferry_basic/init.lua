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
      }
    },
    
    size = "medium",
    destructible = true,
    map_check = {"waterways"},
    
    enhancement = {
        name = "europeans_ferry_yard_advanced",
        enhancement_cost = {
            blackwood = 1,
            grout = 1,
            planks = 1,
            brick = 1,
            marble = 1,
            marble_column = 1,
            quartz = 1,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 3,
            quartz = 1,
            diamond = 1
        }
    },
    buildcost = {
        blackwood = 2,
        planks = 2,
        granite = 2,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 1,
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
        { name = "planks", amount = 6 },
        { name = "rubber", amount = 3 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "sleep=duration:120s",
                "callworker=buildferry_1",
                "consume=planks:2 rubber",
                "callworker=buildferry_2"
            }
        },
    },
}

pop_textdomain()
