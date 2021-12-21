push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_militarysite_type {
    name = "europeans_tower_high",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "High Tower"),
    icon = dirname .. "menu.png",
    size = "medium",
    vision_range = 20,
    
    enhancement = {
        name = "europeans_advanced_tower",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            grout = 2,
            marble_column = 2,
            diamond = 2
        },
        enhancement_return_on_dismantle = {
            planks = 1,
            granite = 2,
            marble = 2,
            diamond = 2
        },
    },
    
    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 47, 78 },
        }
    },

    aihints = {
      fighting = true,
        mountain_conqueror = true,
        prohibited_till = 3600
    },

    max_soldiers = 6,
    heal_per_second = 170,
    conquers = 12,
    prefer_heroes = true,

    messages = {
        -- TRANSLATORS: Message sent by an Europeans military site
        occupied = pgettext("europeans_building", "Your soldiers have occupied your high tower."),
        -- TRANSLATORS: Message sent by an Europeans military site
        aggressor = pgettext("europeans_building", "Your high tower discovered an aggressor."),
        -- TRANSLATORS: Message sent by an Europeans military site
        attack = pgettext("europeans_building", "Your high tower is under attack."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_enemy = pgettext("europeans_building", "The enemy defeated your soldiers at the high tower."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_you = pgettext("europeans_building", "Your soldiers defeated the enemy at the high tower.")
    },
}

pop_textdomain()
