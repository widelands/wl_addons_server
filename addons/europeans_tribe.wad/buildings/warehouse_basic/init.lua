push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_warehouse_type {
    name = "europeans_warehouse_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Warehouse"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         rows = 1,
         columns = 1,
         hotspot = { 60, 78 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 60, 78 }
      },
    },
    
    size = "medium",
    destructible = true,
    
    enhancement = {
        name = "europeans_warehouse_normal",
        enhancement_cost = {
            blackwood = 3,
            cloth = 3,
            grout = 3,
            marble_column = 1,
            quartz = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            granite = 3,
            marble = 1,
            quartz = 1
            
        },
    },
    buildcost = {
        log = 3,
        reed = 3,
        granite = 3,
        marble_column = 1,
        quartz = 1
    },
    return_on_dismantle = {
        scrap_wood = 3,
        reed = 1,
        granite = 2,
        marble = 1,
        quartz = 1
    },

    aihints = {
        very_weak_ai_limit = 3,
        weak_ai_limit = 6,
        normal_ai_limit = 12,
        prohibited_till = 7200,
        forced_after = 9600
    },
    
    vision_range = 16,
    heal_per_second = 160,
}

pop_textdomain()
