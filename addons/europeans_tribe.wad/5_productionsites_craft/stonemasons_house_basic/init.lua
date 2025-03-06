push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/lime_kiln/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_stonemasons_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Lime Kiln"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 45, 53 },
      },
      working = {
         basename = "idle",
         hotspot = { 45, 53 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_stonemasons_house_advanced",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            marble = 2,
            planks = 2,
            cloth = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2
        },
    },
    buildcost = {
        granite = 3,
        log = 3,
        reed = 3
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2,
        marble = 1,
        reed = 1
    },

    aihints = {
        basic_amount = 1,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 2,
    },

    working_positions = {
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "granite", amount = 6 },
        { name = "clay", amount = 6 },
        { name = "water", amount = 6 },
        { name = "coal", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=mixing_grout",
                "sleep=duration:30s",
                "call=burning_bricks",
                "return=skipped"
            }
        },
        mixing_grout = {
            -- TRANSLATORS: Completed/Skipped/Did not start mixing grout because ...
            descname = pgettext("europeans_building", "mixing grout"),
            actions = {
                "return=skipped when economy needs brick and not economy needs grout",
                "return=skipped when economy needs granite and not economy needs grout",
                "return=skipped when economy needs coal and not economy needs grout",
                "consume=coal:2 granite:3",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:2m",
                "consume=water:3",
                "playsound=sound/barbarians/mortar priority:60%",
                "animate=working duration:1m",
                "produce=grout:3"
            }
        },
        burning_bricks = {
            -- TRANSLATORS: Completed/Skipped/Did not start burning bricks because ...
            descname = pgettext("europeans_building", "burning bricks"),
            actions = {
                "return=skipped when economy needs grout and not economy needs brick",
                "return=skipped when economy needs granite and not economy needs brick",
                "return=skipped when economy needs coal and not economy needs brick",
                "consume=granite clay:3",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:1m",
                "consume=coal:2",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:2m",
                "produce=brick:3"
            }
        }
    },
}

pop_textdomain()
