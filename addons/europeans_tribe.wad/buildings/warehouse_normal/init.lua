push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_warehouse_type {
    name = "europeans_warehouse_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Warehouse"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 63, 68 }
      }
    },
       
    size = "medium",
    enhancement = {
        name = "europeans_warehouse_advanced",
        enhancement_cost = {
            brick = 3,
            marble_column = 3,
            quartz = 1,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            granite = 3,
            marble = 3,
            quartz = 1,
            diamond = 1
        },
    },

    aihints = {
        prohibited_till = 3600
    },

    vision_range = 20,
    heal_per_second = 180,
}

pop_textdomain()
