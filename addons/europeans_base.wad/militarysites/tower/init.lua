push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "europeans_tower",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Medium Tower"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 53, 85 },
      }
    },
    
    size = "medium",
    destructible = true,
    
    enhancement = {
        name = "europeans_tower_high",
        enhancement_cost = {
            blackwood = 2,
            grout = 2,
            quartz = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2,
            quartz = 1
        },
    },
    buildcost = {
        log = 3,
        granite = 3,
        quartz = 1
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2,
        quartz = 1
    },
    
    aihints = {
        expansion = true,
        mountain_conqueror = true
    },

    max_soldiers = 4,
    vision_range = 16,
    heal_per_second = 120,
    conquers = 8,
    prefer_heroes = false,

    messages = {
        -- TRANSLATORS: Message sent by an Europeans military site
        occupied = pgettext("europeans_building", "Your soldiers have occupied your medium tower."),
        -- TRANSLATORS: Message sent by an Europeans military site
        aggressor = pgettext("europeans_building", "Your medium tower discovered an aggressor."),
        -- TRANSLATORS: Message sent by an Europeans military site
        attack = pgettext("europeans_building", "Your medium tower is under attack."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_enemy = pgettext("europeans_building", "The enemy defeated your soldiers at the medium tower."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_you = pgettext("europeans_building", "Your soldiers defeated the enemy at the medium tower.")
    },
}

pop_textdomain()
