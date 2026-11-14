push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/micro_brewery/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_brewery_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Brewery"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 42, 50 },
      },
      working = {
         basename = "idle",
         hotspot = { 42, 50 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_brewery_level_1",
        enhancement_cost = {
            granite = 2,
            planks = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1
        }
    },
    buildcost = {
        granite = 2,
        blackwood = 2,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2
    },

    aihints = {
        prohibited_till = 3000,
        basic_amount = 1,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        barbarians_brewer = 1
    },

    inputs = {
        { name = "water", amount = 4 },
        { name = "wheat", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=brew_beer",
                "return=skipped"
            }
        },
        brew_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
            descname = pgettext("europeans_building", "brewing simple wheat beer"),
            actions = {
                -- time total: 30.4 + 30 + 3.6 = 64 sec
                "return=skipped unless economy needs beer",
                "consume=water wheat",
                "sleep=duration:30s400ms",
                "playsound=sound/empire/beerbubble priority:40% allow_multiple",
                "animate=working duration:30s",
                "produce=beer"
            }
        },
    },
}

pop_textdomain()
