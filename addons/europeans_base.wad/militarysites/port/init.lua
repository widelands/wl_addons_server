push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

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
         columns = 10,
         rows = 2,
         hotspot = { 98, 98 }
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 98, 98 }
      },
    },
    
    size = "port",
    destructible = false,
    map_check = {"seafaring"},
    
    enhancement = {
        name = "europeans_port_big",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            planks = 2,
            marble = 2,
            marble_column = 2,
            quartz = 1,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            granite = 3,
            marble = 3,
            quartz = 1,
            diamond = 1
        },
    },
    
    buildcost = {
        brick = 3,
        grout = 3,
        planks = 3,
        marble = 3,
        marble_column = 2,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 3,
        marble = 3,
        quartz = 1,
        diamond = 1
    },

    aihints = {
       supports_seafaring = true,
       very_weak_ai_limit = 8,
       weak_ai_limit = 16,
       normal_ai_limit = 32,
    },

    vision_range = 10,
    heal_per_second = 200,
    conquers = 8,
    max_garrison = 32,
}

pop_textdomain()
