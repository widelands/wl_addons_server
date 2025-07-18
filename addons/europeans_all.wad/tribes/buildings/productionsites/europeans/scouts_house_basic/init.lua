push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/scouts_hut/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_scouts_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Scout’s Hut"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = { 45, 92 },
        },
    },
    spritesheets = {
        build = {
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 44, 92 }
        },
        idle = {
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 44, 92 }
        },
    },

    size = "small",
    enhancement = {
        name = "europeans_scouts_house_level_1",
        enhancement_cost = {
            granite = 1,
            ironwood = 1,
            rope = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1
        }
    },
    buildcost = {
        granite = 2,
        blackwood = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 1
    },

    aihints = {
        prohibited_till = 10800,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        barbarians_scout = 1
    },

    inputs = {
        { name = "ration", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start scouting because ...
            descname = _("scouting"),
            actions = {
                -- time of worker: 82.2-214.8 sec
                -- min. time total: 30 + 82.2 = 112.2 sec
                -- max. time total: 30 + 214.8 = 244.8 sec
                -- avg. time total: (112.2 + 244.8) / 2 = 178.5 sec
                "consume=ration",
                "sleep=duration:30s",
                "callworker=scout"
            }
        },
        targeted_scouting = {
            descname = _("scouting"),
            actions = {
                "consume=ration",
                "callworker=targeted_scouting"
            }
        },
    },
}

pop_textdomain()
