push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/smelting_works/"

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
        prohibited_till = 900,
        basic_amount = 1,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        barbarians_smelter = 1
    },

    inputs = {
        { name = "coal", amount = 4 },
        { name = "iron_ore", amount = 4 }
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
                -- time: 29.4 + 35 + 3.6 = 68 sec
                "return=skipped unless economy needs iron",
                "consume=coal iron_ore",
                "sleep=duration:29s400ms",
                "playsound=sound/metal/furnace priority:50% allow_multiple",
                "animate=working duration:35s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron"
            }
        }
    },
}

pop_textdomain()
