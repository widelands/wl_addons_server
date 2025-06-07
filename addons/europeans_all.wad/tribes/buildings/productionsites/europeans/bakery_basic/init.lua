push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/bakery/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_bakery_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Bakery"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 41, 58 },
      },
      unoccupied = {
         hotspot = { 41, 58 },
      },
      working = {
         basename = "idle",
         hotspot = { 41, 58 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_bakery_level_1",
        enhancement_cost = {
            balsa = 2,
            ironwood = 2,
            rope = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3
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
        prohibited_till = 3600,
        basic_amount = 1,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        barbarians_baker = 1
    },

    inputs = {
        { name = "water", amount = 6 },
        { name = "wheat", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_barbarians_bread",
                "return=skipped"
            }
        },
        produce_barbarians_bread = {
                -- TRANSLATORS: Completed/Skipped/Did not start Baking bread because ...
                descname = pgettext("europeans_building", "Baking barbarians bread"),
                actions = {
                -- time total: 20.8 + 2 * (20 + 3.6) = 68 sec
                "return=skipped unless economy needs barbarians_bread",
                "consume=water:3 wheat:3",
                "sleep=duration:20s800ms",
                "animate=working duration:20s",
                "produce=barbarians_bread",
                "animate=working duration:20s",
                "produce=barbarians_bread"
            }
        },
    },
}

pop_textdomain()
