push_textdomain("gauls.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "gauls_stronghold",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("gauls_building", "Stronghold"),
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
        planks = 2,
        brick = 5,
        reed = 1,
        cloth = 2,
        bronze = 1,
        copper = 1,
        gold = 1
    },
    return_on_dismantle = {
        granite = 5,
        planks = 1,
        brick = 2,
        copper = 1,
        bronze = 1
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
        -- TRANSLATORS: Message sent by a Gauls military site
        occupied = pgettext("gauls_building", "Your warriors have occupied your stronghold."),
        -- TRANSLATORS: Message sent by a Gauls military site
        aggressor = pgettext("gauls_building", "Your stronghold discovered an aggressor."),
        -- TRANSLATORS: Message sent by a Gauls military site
        attack = pgettext("gauls_building", "Your stronghold is under attack."),
        -- TRANSLATORS: Message sent by a Gauls military site
        defeated_enemy = pgettext("gauls_building", "The enemy defeated your warriors at the stronghold."),
        -- TRANSLATORS: Message sent by a Gauls military site
        defeated_you = pgettext("gauls_building", "Your warriors defeated the enemy at the stronghold.")
    },
}

pop_textdomain()

