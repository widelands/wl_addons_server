push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/militarysites/empire/tower/"

wl.Descriptions():new_militarysite_type {
    name = "europeans_tower_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Tower"),
    icon = dirname .. "menu.png",
        
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 58, 91 }
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 58, 91 }
      },
    },
    
    size = "medium",
    destructible = true,
    
    buildcost = {
        brick = 3,
        grout = 3,
        planks = 3,
        marble_column = 3
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2,
        marble = 3
    },

    aihints = {},

    max_soldiers = 8,
    vision_range = 24,
    heal_per_second = 240,
    conquers = 18,
    prefer_heroes = false,

    messages = {
        -- TRANSLATORS: Message sent by an Europeans military site
        occupied = pgettext("europeans_building", "Your soldiers have occupied your advanced tower."),
        -- TRANSLATORS: Message sent by an Europeans military site
        aggressor = pgettext("europeans_building", "Your advanced tower discovered an aggressor."),
        -- TRANSLATORS: Message sent by an Europeans military site
        attack = pgettext("europeans_building", "Your advanced tower is under attack."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_enemy = pgettext("europeans_building", "The enemy defeated your soldiers at the advanced tower."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_you = pgettext("europeans_building", "Your soldiers defeated the enemy at the advanced tower.")
    },
}

pop_textdomain()
