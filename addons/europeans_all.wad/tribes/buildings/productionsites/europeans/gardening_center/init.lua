push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/amazons/gardening_center/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_gardening_center",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Gardening Center"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {hotspot = {43, 44}},
    },
    spritesheets = {
        idle = {
            hotspot = {43, 44},
            fps = 4,
            frames = 4,
            columns = 2,
            rows = 2
        }
    },

    size = "medium",

    aihints = {
        space_consumer = true,
        prohibited_till = 5400,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        amazons_jungle_master = 2
    },

    inputs = {
        { name = "water", amount = 4 },
        { name = "coal", amount = 4 },
        { name = "ration", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start enhancing the fertility of land because ...
            descname = _("enhancing the fertility of land"),
            actions = {
                "consume=water coal ration",
                "call=terraform",
                "call=plant_liana",
                "call=terraform",
                "call=plant_balsa",
                "call=terraform",
                "call=plant_liana",
                "call=terraform",
                "call=plant_rubber",
                "call=terraform",
                "call=plant_liana",
                "call=terraform",
                "call=plant_ironwood"
            }
        },
        terraform = {
            -- TRANSLATORS: Completed/Skipped/Did not start enhancing the fertility of land because ...
            descname = _("enhancing the fertility of land"),
            actions = {
                "callworker=check",
                "callworker=terraform",
                "sleep=duration:8s"
            }
        },
        plant_balsa = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing only one ration because ... (can produce more efficient when supply is good)
            descname = _("planting balsa tree"),
            actions = {
                -- time of worker: 11.2-32.8 sec, mean 21.784 sec
                -- min. time: 11.2 + 13 = 24.2 sec
                -- max. time: 32.8 + 13 = 45.8 sec
                -- mean time: 21.784 + 13 = 34.784 sec
                "return=skipped unless economy needs balsa or economy needs log",
                "callworker=plant_balsa",
                "sleep=duration:13s"
            },
        },
        plant_ironwood = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing only one ration because ... (can produce more efficient when supply is good)
            descname = _("planting ironwood tree"),
            actions = {
                -- time of worker: 11.2-32.8 sec, mean 21.784 sec
                -- min. time: 11.2 + 13 = 24.2 sec
                -- max. time: 32.8 + 13 = 45.8 sec
                -- mean time: 21.784 + 13 = 34.784 sec
                "return=skipped unless economy needs ironwood or economy needs log",
                "callworker=plant_ironwood",
                "sleep=duration:13s"
            },
        },
        plant_liana = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing only one ration because ... (can produce more efficient when supply is good)
            descname = _("planting liana tree"),
            actions = {
                -- time of worker: 11.2-32.8 sec, mean 21.784 sec
                -- min. time: 11.2 + 13 = 24.2 sec
                -- max. time: 32.8 + 13 = 45.8 sec
                -- mean time: 21.784 + 13 = 34.784 sec
                "return=skipped unless economy needs liana or economy needs log",
                "callworker=plant_liana",
                "sleep=duration:13s"
            },
        },
        plant_rubber = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing only one ration because ... (can produce more efficient when supply is good)
            descname = _("planting rubber tree"),
            actions = {
                -- time of worker: 11.2-32.8 sec, mean 21.784 sec
                -- min. time: 11.2 + 13 = 24.2 sec
                -- max. time: 32.8 + 13 = 45.8 sec
                -- mean time: 21.784 + 13 = 34.784 sec
                "return=skipped unless economy needs rubber or economy needs log",
                "callworker=plant_rubber",
                "sleep=duration:13s"
            },
        },
        dummy = {
            -- just a dummy program to fix AI
            descname = "dummy program",
            actions = {
                "produce=balsa ironwood liana rubber",
            },
        },
    },
}

pop_textdomain()
