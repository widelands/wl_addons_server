push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/militarysites/atlanteans/tower_small/"

wl.Descriptions():new_militarysite_type {
    name = "europeans_sentry_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Small Tower"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 46, 71 },
      }
    },
    
    size = "small",
    destructible = true,
    
    enhancement = {
        name = "europeans_sentry_level_3",
        enhancement_cost = {
            brick = 1,
            grout = 1,
            planks = 1,
            marble = 1,
            marble_column = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            marble = 2
        },
    },

    aihints = {},

    max_soldiers = 4,
    vision_range = 8,
    heal_per_second = 80,
    conquers = 6,
    prefer_heroes = false,

    messages = {
        -- TRANSLATORS: Message sent by an Europeans military site
        occupied = pgettext("europeans_building", "Your soldiers have occupied your small tower."),
        -- TRANSLATORS: Message sent by an Europeans military site
        aggressor = pgettext("europeans_building", "Your small tower discovered an aggressor."),
        -- TRANSLATORS: Message sent by an Europeans military site
        attack = pgettext("europeans_building", "Your small tower is under attack."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_enemy = pgettext("europeans_building", "The enemy defeated your soldiers at the small tower."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_you = pgettext("europeans_building", "Your soldiers defeated the enemy at the small tower.")
    },
}

pop_textdomain()
