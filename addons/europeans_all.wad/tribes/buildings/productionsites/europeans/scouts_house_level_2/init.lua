push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/atlanteans/scouts_house/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_scouts_house_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Scout’s House Level 2"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 44, 49 },
        },
    },
    spritesheets = {
        build = {
            frames = 3,
            columns = 3,
            rows = 1,
            hotspot = { 44, 49 },
        },
    },

    size = "small",
    enhancement = {
        name = "europeans_scouts_house_level_3",
        enhancement_cost = {
            brick = 1,
            grout = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            brick = 1
        }
    },

    aihints = {
        prohibited_till = 10800,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        atlanteans_scout = 1
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
                -- min. time of one scouting: 30 + 82.2 = 112.2 sec
                -- max. time of one scouting: 30 + 214.8 = 244.8 sec
                -- avg. time of one scouting: (112.2 + 244.8) / 2 = 178.5 sec
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
