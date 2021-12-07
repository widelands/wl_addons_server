push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_militarysite_type {
    name = "europeans_castle",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Castle"),
    icon = dirname .. "menu.png",
    size = "big",
    
    enhancement = {
        name = "europeans_fortress",
        enhancement_cost = {
            planks = 3,
            brick = 3,
            grout = 3,
            marble_column = 3,
            quartz = 3
        },
        enhancement_return_on_dismantle = {
            planks = 2,
            granite = 3,
            marble = 3,
            quartz = 3
        },
    },

    buildcost = {
        blackwood = 4,
        reed = 4,
        granite = 2,
        quartz = 1
    },
    return_on_dismantle = {
        blackwood = 2,
        granite = 1,
        quartz = 1
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 91, 91 },
        }
    },

    aihints = {
        expansion = true,
        fighting = true,
        mountain_conqueror = true,
        prohibited_till = 9600
    },

    max_soldiers = 12,
    heal_per_second = 200,
    conquers = 14,
    prefer_heroes = true,

    messages = {
        -- TRANSLATORS: Message sent by an Europeans military site
        occupied = pgettext("europeans_building", "Your soldiers have occupied your castle."),
        -- TRANSLATORS: Message sent by an Europeans military site
        aggressor = pgettext("europeans_building", "Your castle discovered an aggressor."),
        -- TRANSLATORS: Message sent by an Europeans military site
        attack = pgettext("europeans_building", "Your castle is under attack."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_enemy = pgettext("europeans_building", "The enemy defeated your soldiers at the castle."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_you = pgettext("europeans_building", "Your soldiers defeated the enemy at the castle.")
    },
}

pop_textdomain()
