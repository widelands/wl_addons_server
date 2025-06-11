push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/barbarians/barrier/"

wl.Descriptions():new_militarysite_type {
    name = "europeans_barrier_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Barrier"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      unoccupied = {
         hotspot = { 44, 62 },
      }
    },
    spritesheets = {
      idle = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 44, 62 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 44, 62 }
      },
    },
    
    size = "medium",
    destructible = true,
    
    enhancement = {
        name = "europeans_barrier_level_1",
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
        granite = 2,
        planks = 4
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2
    },

    aihints = {
        fighting = true
    },

    max_soldiers = 4,
    vision_range = 8,
    heal_per_second = 120,
    conquers = 6,
    prefer_heroes = true,

    messages = {
        -- TRANSLATORS: Message sent by a Barbarian military site
        occupied = pgettext("europeans_building", "Your soldiers have occupied your barrier."),
        -- TRANSLATORS: Message sent by a Barbarian military site
        aggressor = pgettext("europeans_building", "Your barrier discovered an aggressor."),
        -- TRANSLATORS: Message sent by a Barbarian military site
        attack = pgettext("europeans_building", "Your barrier is under attack."),
        -- TRANSLATORS: Message sent by a Barbarian military site
        defeated_enemy = pgettext("europeans_building", "The enemy defeated your soldiers at the barrier."),
        -- TRANSLATORS: Message sent by a Barbarian military site
        defeated_you = pgettext("europeans_building", "Your soldiers defeated the enemy at the barrier.")
    },
}

pop_textdomain()
