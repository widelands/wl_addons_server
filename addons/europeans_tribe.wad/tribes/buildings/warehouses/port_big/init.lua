push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/warehouses/empire/port/"

wl.Descriptions():new_warehouse_type {
    name = "europeans_port_big",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Big Port"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
        idle = {
            fps = 10,
            frames = 20,
            columns = 10,
            rows = 2,
            hotspot = { 87, 116 }
        },
        build = {
            frames = 4,
            columns = 4,
            rows = 1,
            hotspot = { 87, 116 }
        },
    },
    
    size = "port",
    destructible = false,
    map_check = {"seafaring"},
    
    buildcost = {
        brick = 5,
        grout = 5,
        planks = 5,
        marble_column = 4
    },
    return_on_dismantle = {
        scrap_wood = 5,
        granite = 6,
        marble = 4
    },
    
    aihints = {
        supports_seafaring = true,
        very_weak_ai_limit = 8,
        weak_ai_limit = 16,
        normal_ai_limit = 32,
        prohibited_till = 7200
    },

    vision_range = 16,
    heal_per_second = 240,
    conquers = 12,
    max_garrison = 48,
}

pop_textdomain()
