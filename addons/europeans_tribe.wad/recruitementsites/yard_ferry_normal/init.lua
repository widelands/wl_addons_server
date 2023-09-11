push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_ferry_yard_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Ferry Yard"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 56, 72 },
      }
    },
    
    size = "medium",
    destructible = true,
    map_check = {"waterways"},
    
    enhancement = {
        name = "europeans_ferry_yard_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble = 1,
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

    aihints = {},

    working_positions = {
        europeans_shipwright_normal = 1,
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
                "sleep=duration:80s",
                "callworker=buildferry_1",
                "consume=planks:2 cloth",
                "callworker=buildferry_2"
            }
        },
    },
}

pop_textdomain()
