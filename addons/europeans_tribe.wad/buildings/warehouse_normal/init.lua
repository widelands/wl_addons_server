push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_warehouse_type {
    name = "europeans_warehouse_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Warehouse"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_warehouse_advanced",
        enhancement_cost = {
            brick = 3,
            grout = 3,
            marble_column = 3,
            quartz = 1,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            granite = 3,
            marble = 3,
            quartz = 1,
            diamond = 1
        },
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 58, 62 }
        }
    },

    aihints = {
        prohibited_till = 3600
    },

    heal_per_second = 170,
}

pop_textdomain()
