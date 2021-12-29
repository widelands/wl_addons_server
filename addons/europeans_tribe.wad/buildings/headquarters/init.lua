push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_warehouse_type {
    name = "europeans_headquarters",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Headquarters"),
    icon = dirname .. "menu.png",
    size = "big",
    destructible = true,

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 95, 109 },
        },
    },

    buildcost = {
        blackwood = 6,
        planks = 6,
        cloth = 4,
        reed = 4,
        brick = 4,
        grout = 4,
        marble_column = 4,
        quartz = 3,
        diamond = 3
    },
    return_on_dismantle = {
        blackwood = 3,
        planks = 3,
        granite = 4,
        marble = 2,
        quartz = 2,
        diamond = 2
    },


    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 2
    },

    heal_per_second = 220,
    conquers = 16,
}

pop_textdomain()
