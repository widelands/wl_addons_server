push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_warehouse_type {
    name = "europeans_port",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Port"),
    icon = dirname .. "menu.png",
    size = "port",
    map_check = {"seafaring"},

    buildcost = {
        blackwood = 3,
        planks = 3,
        reed = 2,
        cloth = 2,
        brick = 2,
        grout = 2,
        marble_column = 2,
        quartz = 2,
        diamond = 2
    },
    return_on_dismantle = {
        blackwood = 1,
        planks = 1,
        reed = 2,
        granite = 2,
        marble = 2,
        quartz = 2,
        diamond = 2
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 74, 70 },
            fps = 10
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 74, 70 },
        }
    },

    aihints = {
    },

    conquers = 6,
    heal_per_second = 170,
}

pop_textdomain()
