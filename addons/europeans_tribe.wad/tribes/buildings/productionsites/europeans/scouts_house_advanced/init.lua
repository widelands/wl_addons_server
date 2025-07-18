push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/scouts_house/"

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
    
    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
        prohibited_till = 7200
    },

    working_positions = {
        europeans_scout_advanced = 1
    },

    inputs = {
        { name = "fruit", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start scouting because ...
            descname = _"scouting",
            actions = {
                "return=skipped when economy needs snack and not workers need experience",
                "consume=fruit",
                "sleep=duration:15s",
                "callworker=scout",
                "sleep=duration:15s",
                "callworker=scout",
                "sleep=duration:15s",
                "callworker=scout",
                "sleep=duration:15s",
                "callworker=scout"
            }
        },
        targeted_scouting = {
            descname = _"scouting",
            actions = {
                "consume=fruit",
                "callworker=targeted_scouting"
            }
        },
    },
}

pop_textdomain()
