push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/tavern/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_tavern_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Tavern"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 57, 88 },
        },
    },
    spritesheets = {
        build = {
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 51, 70 }
        },
        working = {
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 51, 70 }
        },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_inn_basic",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            planks = 2,
            marble = 2,
            cloth = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 1
        }
    },
    
    buildcost = {
        granite = 3,
        log = 3,
        reed = 2,
        cloth = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_worker_basic = 2
    },

    inputs = {
        { name = "beer", amount = 4 },
        { name = "bread", amount = 4 },
        { name = "meat", amount = 2 },
        { name = "fish", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=producing_ration",
                "return=skipped"
            }
        },
        producing_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration" because ...
            descname = pgettext("europeans_building", "preparing a ration"),
            actions = {
                "return=skipped unless economy needs ration",
                "consume=beer bread fish,meat",
                "sleep=duration:5s",
                "playsound=sound/empire/taverns/ration priority:80%",
                "animate=working duration:10s",
                "sleep=duration:5s",
                "produce=ration"
            }
        }
    },
}

pop_textdomain()
