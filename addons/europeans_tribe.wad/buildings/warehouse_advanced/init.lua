push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_warehouse_type {
    name = "europeans_warehouse_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Warehouse"),
    icon = dirname .. "menu.png",
    size = "medium",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 58, 55 }
        }
    },

    aihints = {},

    heal_per_second = 200,
}

pop_textdomain()
