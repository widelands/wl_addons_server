push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/amazons/scouts_hut/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_scouts_house_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Scout’s Hut Level 1"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {hotspot = {43, 57}},
        unoccupied = {hotspot = {43, 57}}
    },

    size = "small",
    enhancement = {
        name = "europeans_scouts_house_level_2",
        enhancement_cost = {
            granite = 1,
            planks = 1,
            spidercloth = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1
        }
    },

    aihints = {
        prohibited_till = 10800,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        amazons_scout = 1
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
                -- min. time total: 82.2 + 30 = 112.2 sec
                -- max. time total: 214.8 + 30 = 244.8 sec
                -- avg. time total: (112.2 + 244.8) / 2 = 178.5 sec
                "consume=ration",
                "callworker=scout",
                "sleep=duration:30s"
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
