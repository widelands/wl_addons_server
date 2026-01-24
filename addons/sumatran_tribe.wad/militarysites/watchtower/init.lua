push_textdomain("sumatran_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "sumatran_watchtower",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("sumatran_building", "Watchtower"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 40, 107 },
      }
    },
    
    size = "medium",
    destructible = true,
    
    enhancement = {
        name = "sumatran_fortified_tower",
        enhancement_cost = {
            granite = 1,
            tropicalwood = 2,
            diamond = 1,
        },
        enhancement_return_on_dismantle = {
            tropicalwood = 1,
            diamond = 1
        },
    },
    buildcost = {
        granite = 4,
        tropicalwood = 1,
        reed = 1,
        cloth = 1
    },
    return_on_dismantle = {
        granite = 2,
        tropicalwood = 1
    },
    
    aihints = {
        prohibited_till = 960,
        basic_amount = 2,
        expansion = true,
        fighting = true,
    },

    max_soldiers = 3,
    vision_range = 14,
    heal_per_second = 150,
    conquers = 8,
    prefer_heroes = true,

    messages = {
        -- TRANSLATORS: Message sent by a Sumatran military site
        occupied = pgettext("sumatran_building", "Your warriors have occupied your watchtower."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        aggressor = pgettext("sumatran_building", "Your watchtower discovered an aggressor."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        attack = pgettext("sumatran_building", "Your watchtower is under attack."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        defeated_enemy = pgettext("sumatran_building", "The enemy defeated your warriors at the watchtower."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        defeated_you = pgettext("sumatran_building", "Your warriors defeated the enemy at the watchtower.")
    },
}

pop_textdomain()
