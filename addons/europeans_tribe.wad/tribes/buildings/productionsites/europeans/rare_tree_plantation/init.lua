push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/amazons/rare_tree_plantation/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_special_tree_plantation",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Special Tree Plantation"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {unoccupied = {hotspot = {48, 50}}},
    spritesheets = {
        idle = {
            hotspot = {49, 50},
            fps = 4,
            frames = 4,
            columns = 2,
            rows = 2
        }
    },

    size = "medium",
    enhancement = {
        name = "europeans_gardening_center",
        enhancement_cost = {
            balsa = 2,
            ironwood = 2,
            rope = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            rope = 1
        }
    },
    buildcost = {
        log = 3,
        granite = 3
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 2
    },

    aihints = {
        space_consumer = true,
        prohibited_till = 1800,
        basic_amount = 1,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        europeans_forester = 1
    },
    
    inputs = {
        { name = "water", amount = 8 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=plant_liana",
                "call=plant_balsa",
                "call=plant_liana",
                "call=plant_rubber",
                "call=plant_liana",
                "call=plant_ironwood",
            },
        },
        plant_balsa = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing only one ration because ... (can produce more efficient when supply is good)
            descname = _("planting balsa tree"),
            actions = {
                "return=skipped unless economy needs balsa or economy needs log",
                "consume=water",
                "callworker=plant_balsa_tree",
                "sleep=duration:13s"
            },
        },
        plant_ironwood = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing only one ration because ... (can produce more efficient when supply is good)
            descname = _("planting ironwood tree"),
            actions = {
                "return=skipped unless economy needs ironwood or economy needs log",
                "consume=water",
                "callworker=plant_ironwood_tree",
                "sleep=duration:13s"
            },
        },
        plant_liana = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing only one ration because ... (can produce more efficient when supply is good)
            descname = _("planting liana tree"),
            actions = {
                "return=skipped unless economy needs liana or economy needs log",
                "consume=water",
                "callworker=plant_liana_tree",
                "sleep=duration:13s"
            },
        },
        plant_rubber = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing only one ration because ... (can produce more efficient when supply is good)
            descname = _("planting rubber tree"),
            actions = {
                "return=skipped unless economy needs rubber or economy needs log",
                "consume=water",
                "callworker=plant_rubber_tree",
                "sleep=duration:13s"
            },
        },
    }
}

pop_textdomain()
