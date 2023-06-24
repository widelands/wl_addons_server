push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

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
        blackwood = 6,
        cloth = 6,
        grout = 6,
        planks = 4,
        brick = 4,
        marble = 4,
        marble_column = 2,
        quartz = 2,
        diamond = 2
    },
    return_on_dismantle = {
        scrap_wood = 8,
        granite = 8,
        marble = 6,
        quartz = 2,
        diamond = 2
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 1,
        prohibited_till = 9600
    },

    vision_range = 24,
    heal_per_second = 320,
    conquers = 16,
}

pop_textdomain()
