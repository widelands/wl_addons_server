push_textdomain("sumatran_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "sumatran_fort",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("sumatran_building", "Fort"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 99, 113 }
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 99, 113 }
      },
    },
    
    size = "big",
    destructible = true,
    
    buildcost = {
        granite = 8,
        tropicalwood = 6,
        reed = 2,
        cloth = 2,
        diamond = 4,
        copper = 1
    },
    return_on_dismantle = {
        granite = 4,
        tropicalwood = 2,
        cloth = 1,
        diamond = 2,
        copper = 1
    },
    
    aihints = {
        prohibited_till = 5400,
        mountain_conqueror = true
    },

    max_soldiers = 10,
    vision_range = 16,
    heal_per_second = 220,
    conquers = 12,
    prefer_heroes = true,

    messages = {
        -- TRANSLATORS: Message sent by a Sumatran military site
        occupied = pgettext("sumatran_building", "Your warriors have occupied your fort."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        aggressor = pgettext("sumatran_building", "Your fort discovered an aggressor."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        attack = pgettext("sumatran_building", "Your fort is under attack."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        defeated_enemy = pgettext("sumatran_building", "The enemy defeated your warriors at the fort."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        defeated_you = pgettext("sumatran_building", "Your warriors defeated the enemy at the fort.")
    },
}

pop_textdomain()

