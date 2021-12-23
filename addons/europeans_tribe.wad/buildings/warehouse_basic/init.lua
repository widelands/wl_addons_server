push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_warehouse_type {
    name = "europeans_warehouse_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Warehouse"),
    icon = dirname .. "menu.png",
    size = "medium",
    
    enhancement = {
        name = "europeans_warehouse_normal",
        enhancement_cost = {
            planks = 3,
            cloth = 3,
            quartz = 1,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            planks = 2,
            quartz = 1,
            diamond = 1
        },
    },

    buildcost = {
        blackwood = 4,
        reed = 4,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        blackwood = 3,
        reed = 1,
        quartz = 1,
        diamond = 1
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 60, 78 },
        },
        build = {
            hotspot = { 60, 78 },
        }
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 4
    },

    heal_per_second = 140,
}

pop_textdomain()
