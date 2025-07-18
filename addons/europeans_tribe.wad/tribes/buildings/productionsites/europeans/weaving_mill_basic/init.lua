push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/weaving_mill/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_weaving_mill_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Weaving Mill"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 27, 56 },
      },
      build = {
         hotspot = { 27, 56 },
      },
      working = {
         hotspot = { 27, 56 },
      },
    },
    
    size = "big",
    enhancement = {
        name = "europeans_weaving_mill_level_1",
        enhancement_cost = {
            ironwood = 2,
            balsa = 2,
            rope = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2
        }
    },
    
    buildcost = {
        granite = 4,
        blackwood = 4,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 3
    },

    aihints = {
        supports_seafaring = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        europeans_worker_basic = 3
    },

    inputs = {
        { name = "reed", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_cloth",
                "return=skipped"
            }
        },
        produce_cloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = pgettext("europeans_building", "weaving cloth"),
            actions = {
                "return=skipped unless economy needs cloth or workers need experience",
                "consume=reed:3",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:3m",
                "produce=cloth:2"
            }
        },
    },
}

pop_textdomain()
