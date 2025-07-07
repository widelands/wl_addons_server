push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/empire/headquarters/"

wl.Descriptions():new_warehouse_type {
    name = "europeans_headquarters",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Headquarters"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 100, 115 },
      },
    },
    
    size = "big",
    destructible = false,
    buildcost = {
        brick = 4,
        grout = 4,
        planks = 4,
        marble_column = 4
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 3,
        marble = 3
    },
    
    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 4,
        prohibited_till = 10800
    },

    vision_range = 24,
    heal_per_second = 320,
    conquers = 20,
    max_garrison = 48,
}

pop_textdomain()
