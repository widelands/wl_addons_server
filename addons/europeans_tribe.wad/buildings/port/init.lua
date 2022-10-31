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
    map_check = {"seafaring"},
    buildcost = {
        blackwood = 3,
        planks = 3,
        reed = 2,
        cloth = 2,
        brick = 2,
        grout = 2,
        marble_column = 2,
        quartz = 2,
        diamond = 2
    },
    return_on_dismantle = {
        scrap_wood = 4,
        reed = 2,
        granite = 2,
        marble = 2,
        quartz = 2,
        diamond = 2
    },

    aihints = {
    },

    vision_range = 20,
    conquers = 6,
    heal_per_second = 180,
}

pop_textdomain()
