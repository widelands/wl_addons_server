push_textdomain("barbarians_empire_economy_upgrade.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "empire_stonemasons_house",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("empire_building", "Stonemason’s House"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 63, 64 },
      },
      working = {
         basename = "working",
         hotspot = { 63, 64 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "empire_stonemasons_house_advanced",
        enhancement_cost = {
            log = 1,
            granite = 1,
            marble = 1,
            marble_column = 1,
            planks = 1
        },
        enhancement_return_on_dismantle = {
            log = 1,
            marble = 1,
            planks = 1
        },
    },
    buildcost = {
        log = 1,
        granite = 1,
        marble = 3,
        planks = 1

    },
    return_on_dismantle = {
        granite = 1,
        marble = 2,
    },

    aihints = {
        very_weak_ai_limit = 2,
        weak_ai_limit = 1,
        normal_ai_limit = 1,
    },

    working_positions = {
        empire_stonemason = 1,
    },

    inputs = {
        { name = "marble", amount = 6 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=sculpting_marble_column",
                "sleep=duration:15s",
                "return=skipped"
            }
        },
        sculpting_marble_column = {
            -- TRANSLATORS: Completed/Skipped/Did not start sculpting a marble column because ...
            descname = pgettext("empire_building", "sculpting marble columns"),
            actions = {
                "return=skipped unless economy needs marble_column",
                "consume=marble:2",
                "playsound=sound/stonecutting/stonemason priority:50% allow_multiple",
                "animate=working duration:1m",
                "produce=marble_column",
            }
        }
    },
}

pop_textdomain()
