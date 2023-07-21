push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_scouts_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Scout’s House"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      build = {
         frames = 3,
         columns = 3,
         rows = 1,
         hotspot = { 55, 57 }
      },
      idle = {
         fps = 10,
         frames = 12,
         columns = 6,
         rows = 2,
         hotspot = { 55, 57 }
      },
    },
    
    size = "small",
    destructible = true,
    
    enhancement = {
        name = "europeans_trading_post",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            marble = 1,
            quartz = 1,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            marble = 1
        }
    },

    aihints = {},

    working_positions = {
        europeans_scout_advanced = 1
    },

    inputs = {
        { name = "meal", amount = 2 },
        { name = "wine", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start scouting because ...
            descname = _"scouting",
            actions = {
                "consume=meal wine",
                "sleep=duration:30s",
                "callworker=scout"
            }
        },
        targeted_scouting = {
            descname = _"scouting",
            actions = {
                "consume=meal wine",
                "callworker=targeted_scouting"
            }
        },
    },
}

pop_textdomain()
