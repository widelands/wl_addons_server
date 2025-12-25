push_textdomain("gauls.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_warehouse_type {
    name = "gauls_port",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("gauls_building", "Port"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
       idle = {
          fps = 10,
          frames = 20,
          rows = 5,
          columns = 4,
          hotspot = { 66, 80 }
       },
       build = {
          frames = 4,
         rows = 2,
          columns = 2,
          hotspot = { 59, 77 }
       },
    },
    
    size = "port",
    map_check = {"seafaring"},
    
    buildcost = {
        log = 3,
        granite = 4,
        planks = 3,
        brick = 3,
        reed = 3,
        cloth = 2,
        bronze = 1,
        copper = 1,
        gold = 1
    },
    return_on_dismantle = {
        log = 1,
        granite = 2,
        planks = 2,
        brick = 1,
        reed = 1,
        cloth = 1,
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
