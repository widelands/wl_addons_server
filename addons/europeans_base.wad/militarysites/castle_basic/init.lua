push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "europeans_castle_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Fortress"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      unoccupied = {
         hotspot = { 103, 80 }
      }
    },
    spritesheets = {
      idle = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 101, 80 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 101, 80 }
      },
    },
    size = "big",
    destructible = true,
    
    enhancement = {
        name = "europeans_castle_level_1",
        enhancement_cost = {
            blackwood = 3,
            grout = 3,
            quartz = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            granite = 3,
            quartz = 1
        },
    },

    buildcost = {
        log = 6,
        granite = 4,
        quartz = 1
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 3,
        quartz = 1
    },

    aihints = {
        fighting = true
    },

    max_soldiers = 8,
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
