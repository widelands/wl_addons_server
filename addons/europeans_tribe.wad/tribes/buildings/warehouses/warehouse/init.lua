push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/empire/warehouse/"

wl.Descriptions():new_warehouse_type {
    name = "europeans_warehouse",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Warehouse"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 58, 58 }
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 58, 58 }
      },
    },

    size = "big",
    destructible = false,
    
    enhancement = {
        name = "europeans_headquarters",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            planks = 2,
            marble_column = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 3,
            marble = 2
        },
    },
    
    buildcost = {
        brick = 2,
        grout = 2,
        planks = 2,
        marble_column = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 3,
        marble = 2
    },
    
    aihints = {
        very_weak_ai_limit = 2,
        weak_ai_limit = 4,
        normal_ai_limit = 8,
        prohibited_till = 7200
    },

    vision_range = 10,
    heal_per_second = 160,
    --conquers = 6,
    max_garrison = 16,
}

pop_textdomain()
