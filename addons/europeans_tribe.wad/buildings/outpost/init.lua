push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "europeans_outpost",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Outpost"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 59, 77 }
      }
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_advanced_barrier",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            grout = 2,
            marble_column = 2,
            diamond = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2,
            diamond = 2
        },
    },

    aihints = {
        fighting = true
    },

    max_soldiers = 4,
    vision_range = 12,
    heal_per_second = 160,
    conquers = 8,
    prefer_heroes = true,

    messages = {
        -- TRANSLATORS: Message sent by an Europeans military site
        occupied = pgettext("europeans_building", "Your soldiers have occupied your outpost."),
        -- TRANSLATORS: Message sent by an Europeans military site
        aggressor = pgettext("europeans_building", "Your outpost discovered an aggressor."),
        -- TRANSLATORS: Message sent by an Europeans military site
        attack = pgettext("europeans_building", "Your outpost is under attack."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_enemy = pgettext("europeans_building", "The enemy defeated your soldiers at the outpost."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_you = pgettext("europeans_building", "Your soldiers defeated the enemy at the outpost.")
    },
}

pop_textdomain()
