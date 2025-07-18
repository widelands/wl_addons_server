push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/smelting_works/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_smelting_works_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Smelting Works"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 44, 58 },
      },
      working = {
         basename = "idle",
         hotspot = { 44, 58 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_smelting_works_level_1",
        enhancement_cost = {
            granite = 2,
            ironwood = 2,
            rope = 1
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
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        europeans_worker_basic = 3
    },

    inputs = {
        { name = "coal", amount = 4 },
        { name = "ore", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=smelting_ore",
                "return=skipped"
            }
        },
        smelting_ore = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting ore because ...
            descname = pgettext("europeans_building", "smelting ore"),
            actions = {
                "return=skipped when economy needs coal and not economy needs gold",
                "consume=ore:2 coal:2",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working duration:2m",
                "playsound=sound/metal/ironping priority:60%",
                "produce=gold",
                "animate=working duration:2m",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold"
            }
        }
    },
}

pop_textdomain()
