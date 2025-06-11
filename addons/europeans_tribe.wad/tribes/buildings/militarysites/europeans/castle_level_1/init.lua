push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/barbarians/citadel/"

wl.Descriptions():new_militarysite_type {
    name = "europeans_castle_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Citadel"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
      unoccupied = {
         hotspot = { 102, 102 }
      }
    },
    spritesheets ={
      idle = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 102, 102 }
      },
      build = {
         frames = 6,
         rows = 3,
         columns = 2,
         hotspot = { 102, 102 }
      },
    },

    size = "big",
    destructible = true,
    
    enhancement = {
        name = "europeans_castle_level_2",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            marble_column = 4
        },
        enhancement_return_on_dismantle = {
            granite = 2,
            marble = 4
        },
    },
    
    buildcost = {
        brick = 4,
        grout = 4,
        planks = 4
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 4
    },

    aihints = {},

    max_soldiers = 10,
    vision_range = 16,
    heal_per_second = 200,
    conquers = 12,
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
