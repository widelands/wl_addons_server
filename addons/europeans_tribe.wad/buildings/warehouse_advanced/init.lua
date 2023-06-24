push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_warehouse_type {
    name = "europeans_warehouse_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Warehouse"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 58, 58 }
      }
    },

    size = "medium",
    destructible = false,
    
    aihints = {},

    vision_range = 24,
    heal_per_second = 200,
}

pop_textdomain()
