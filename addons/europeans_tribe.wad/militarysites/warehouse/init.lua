push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

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
            blackwood = 2,
            planks = 2,
            cloth = 2,
            brick = 2,
            grout = 2,
            marble = 2,
            marble_column = 1,
            quartz = 1,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 4,
            granite = 3,
            marble = 3,
            quartz = 1,
            diamond = 1
        },
    },
    
    buildcost = {
        blackwood = 2,
        planks = 2,
        cloth = 2,
        brick = 2,
        grout = 2,
        marble = 2,
        marble_column = 2,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 3,
        marble = 4,
        quartz = 1,
        diamond = 1
    },
    
    aihints = {},

    vision_range = 12,
    heal_per_second = 200,
    --conquers = 6,
}

pop_textdomain()
