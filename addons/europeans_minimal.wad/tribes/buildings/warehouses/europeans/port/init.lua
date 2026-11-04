push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/barbarians/port/"

wl.Descriptions():new_warehouse_type {
    name = "europeans_port",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Port"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 66, 80 }
        },
        build = {
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 59, 77 }
        },
    },

    size = "port",
    destructible = false,
    map_check = {"seafaring"},

    enhancement = {
        name = "europeans_port_big",
        enhancement_cost = {
            granite = 2,
            clay = 2,
            marble = 2,
            log = 2,
            ironwood = 2,
            balsa = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1,
            marble = 1
        },
    },

    buildcost = {
        granite = 3,
        clay = 3,
        log = 2,
        ironwood = 2,
        balsa = 2,
        marble = 3
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2,
        marble = 2
    },

    aihints = {
        supports_seafaring = true,
        very_weak_ai_limit = 8,
        weak_ai_limit = 16,
        normal_ai_limit = 32,
        prohibited_till = 14400
    },

    vision_range = 10,
    heal_per_second = 200,
    conquers = 8,
    max_garrison = 32,
}

pop_textdomain()
