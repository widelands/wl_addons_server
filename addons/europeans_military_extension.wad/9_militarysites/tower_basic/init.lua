push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "europeans_tower_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Tower"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
      unoccupied = {
         hotspot = { 48, 84 }
      }
    },
    spritesheets = {
      idle = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 48, 84 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 48, 84 }
      },
    },

    size = "medium",
    destructible = true,
    
    enhancement = {
        name = "europeans_tower_level_1",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            planks = 2,
            marble = 2,
            marble_column = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 4
        },
    },
    buildcost = {
        granite = 2,
        log = 4,
        reed = 4
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2,
        reed = 2
    },
    
    aihints = {
        expansion = true,
        fighting = false,
        mountain_conqueror = true
    },

    max_soldiers = 4,
    vision_range = 12,
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

