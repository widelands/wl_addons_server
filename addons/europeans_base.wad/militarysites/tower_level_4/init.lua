push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "europeans_super_tower",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Super Tower"),
    icon = dirname .. "menu.png",
    
    enhancement = {
        name = "europeans_ultra_tower",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            planks = 2,
            marble_column = 2,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2,
            diamond = 1
        },
    },
    
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

    aihints = {},

    max_soldiers = 8,
    vision_range = 32,
    heal_per_second = 200,
    conquers = 32,
    prefer_heroes = true,

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
