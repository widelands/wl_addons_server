push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/ferry_yard/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_ferry_yard_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Ferry Yard"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 62, 48 },
        }
    },

    map_check = {"waterways"},
    size = "medium",
    enhancement = {
        name = "europeans_ferry_yard_level_1",
        enhancement_cost = {
            balsa = 2,
            rubber = 3,
            rope = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 4,
            rubber = 1,
            rope = 1
        }
    },
    buildcost = {
        blackwood = 3,
        granite = 3,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2,
        reed = 1
    },

    aihints = {
        needs_water = true,
        prohibited_till = 7200,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        barbarians_shipwright = 1
    },

    inputs = {
        { name = "log", amount = 6 },
        { name = "cloth", amount = 3 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                -- time of worker: 17.2-38.8 sec
                -- min. time total: 20 + 17.2 = 37.2 sec
                -- max. time total: 20 + 38.8 = 58.8 sec
                "sleep=duration:20s",
                "return=skipped unless fleet needs ferry",
                "consume=log:2 cloth",
                "callworker=buildferry"
            }
        },
    },
}

pop_textdomain()
