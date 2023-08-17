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
        name = "europeans_ferry_yard_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2,
            grout = 2,
            quartz = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            quartz = 1
        },
    },
    buildcost = {
        log = 3,
        blackwood = 2,
        planks = 2,
        reed = 3,
        granite = 2
    },
    return_on_dismantle = {
        scrap_wood = 4,
        reed = 1,
        granite = 1
    },

    aihints = {
        needs_water = true,
        shipyard = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        --normal_ai_limit = 2,
    },

    working_positions = {
        europeans_shipwright_basic = 1
    },

    inputs = {
        { name = "planks", amount = 6 },
        { name = "cloth", amount = 3 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "sleep=duration:45s",
                "callworker=buildferry_1",
                "consume=planks:2 cloth",
                "callworker=buildferry_2"
            }
        },
    },
}

pop_textdomain()
