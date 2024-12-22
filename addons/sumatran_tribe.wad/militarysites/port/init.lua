push_textdomain("sumatran_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_warehouse_type {
    name = "sumatran_port",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("sumatran_building", "Port"),
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
    map_check = {"seafaring"},
    
    buildcost = {
        stone = 5,
        tropicalwood = 4,
        reed = 3,
        cloth = 3,
        diamond = 2,
        copper = 2,
        gold = 2
    },
    return_on_dismantle = {
        stone = 3,
        tropicalwood = 2,
        cloth = 2,
        diamond = 1,
        copper = 1,
        gold = 1
    },

    aihints = {
       prohibited_till = 1320,
       very_weak_ai_limit = 4,
       weak_ai_limit = 8,
       normal_ai_limit = 12,
    },

    conquers = 5,
    heal_per_second = 170,
    max_garrison = 20,
}

pop_textdomain()
