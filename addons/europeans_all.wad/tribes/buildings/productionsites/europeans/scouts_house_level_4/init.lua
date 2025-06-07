push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/frisians/scouts_house/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_scouts_house_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Scout’s House Level 4"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {40, 60}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {40, 66},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },

    size = "small",

    aihints = {
        prohibited_till = 10800,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        frisians_scout = 1
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
