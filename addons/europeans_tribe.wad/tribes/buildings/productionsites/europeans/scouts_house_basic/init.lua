push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/scouts_hut/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_scouts_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Scouts House"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
      unoccupied = {
         hotspot = { 45, 92 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 44, 92 }
      },
      idle = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 44, 92 }
      },
    },    
    
    size = "small",
    destructible = true,
    
    enhancement = {
        name = "europeans_scouts_house_advanced",
        enhancement_cost = {
            brick = 1,
            grout = 1,
            marble_column = 1
        },
        enhancement_return_on_dismantle = {
            granite = 1,
            marble = 1
        },
    },

    buildcost = {
        granite = 2,
        planks = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 1
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
        prohibited_till = 3600
    },

    working_positions = {
        europeans_scout_basic = 1
    },

    inputs = {
        { name = "fruit", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start scouting because ...
            descname = pgettext("europeans_building", "scouting"),
            actions = {
                "return=skipped when economy needs ration and not workers need experience",
                "consume=fruit",
                "sleep=duration:15s",
                "callworker=scout",
                "sleep=duration:15s",
                "callworker=scout"
            }
        },
        targeted_scouting = {
            descname = pgettext("europeans_building", "scouting"),
            actions = {
                "consume=fruit",
                "callworker=targeted_scouting"
            }
        },
    },
}

pop_textdomain()
