push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/empire/outpost/"

wl.Descriptions():new_militarysite_type {
    name = "europeans_barrier_level_1",
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
    destructible = true,
    
    enhancement = {
        name = "europeans_barrier_level_2",
        enhancement_cost = {
            brick = 1,
            grout = 1,
            marble_column = 1
        },
        enhancement_return_on_dismantle = {
            granite = 1,
            marble = 1
        },
    },
    buildcost = {
        brick = 3,
        grout = 3,
        planks = 3,
        marble_column = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2,
        marble = 2
    },

    aihints = {},

    max_soldiers = 8,
    vision_range = 10,
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
