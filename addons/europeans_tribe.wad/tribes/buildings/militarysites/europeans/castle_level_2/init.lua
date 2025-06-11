push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/empire/fortress/"

wl.Descriptions():new_militarysite_type {
    name = "europeans_castle_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Fortress"),
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
    
    enhancement = {
        name = "europeans_castle_level_3",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            marble_column = 2
        },
        enhancement_return_on_dismantle = {
            granite = 2,
            marble = 2
        },
    },
    buildcost = {
        brick = 4,
        grout = 4,
        planks = 4,
        marble_column = 4
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 4,
        marble = 4
    },

    aihints = {},

    max_soldiers = 12,
    vision_range = 24,
    heal_per_second = 300,
    conquers = 18,
    prefer_heroes = true,

    messages = {
        -- TRANSLATORS: Message sent by an Europeans military site
        occupied = pgettext("europeans_building", "Your soldiers have occupied your fortress."),
        -- TRANSLATORS: Message sent by an Europeans military site
        aggressor = pgettext("europeans_building", "Your fortress discovered an aggressor."),
        -- TRANSLATORS: Message sent by an Europeans military site
        attack = pgettext("europeans_building", "Your fortress is under attack."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_enemy = pgettext("europeans_building", "The enemy defeated your soldiers at the fortress."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_you = pgettext("europeans_building", "Your soldiers defeated the enemy at the fortress.")
    },
}

pop_textdomain()
