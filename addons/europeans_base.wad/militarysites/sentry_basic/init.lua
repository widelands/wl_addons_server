push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "europeans_guardhouse",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Guardhouse"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 40, 47 },
      }
    },
    
    size = "small",
    destructible = true,
    
    enhancement = {
        name = "europeans_tower_small",
        enhancement_cost = {
            blackwood = 1,
            grout = 1,
            quartz = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            quartz = 1
        },
    },
    buildcost = {
        log = 2,
        granite = 2,
        quartz = 1
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2,
        quartz = 1
    },
    
    aihints = {
        expansion = true,
        mountain_conqueror = true
    },

    max_soldiers = 2,
    vision_range = 8,
    heal_per_second = 60,
    conquers = 6,
    prefer_heroes = false,

    messages = {
        -- TRANSLATORS: Message sent by an Europeans military site
        occupied = pgettext("europeans_building", "Your soldiers have occupied your guardhouse."),
        -- TRANSLATORS: Message sent by an Europeans military site
        aggressor = pgettext("europeans_building", "Your guardhouse discovered an aggressor."),
        -- TRANSLATORS: Message sent by an Europeans military site
        attack = pgettext("europeans_building", "Your guardhouse is under attack."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_enemy = pgettext("europeans_building", "The enemy defeated your soldiers at the guardhouse."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_you = pgettext("europeans_building", "Your soldiers defeated the enemy at the guardhouse.")
    },
}

pop_textdomain()
