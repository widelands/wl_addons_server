push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/militarysites/empire/barrier/"

wl.Descriptions():new_militarysite_type {
    name = "europeans_barrier_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Barrier"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 52, 79 }
      }
    },
    
    size = "medium",
    destructible = true,
    
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

    max_soldiers = 10,
    vision_range = 12,
    heal_per_second = 200,
    conquers = 10,
    prefer_heroes = true,

    messages = {
        -- TRANSLATORS: Message sent by an Empire military site
        occupied = pgettext("europeans_building", "Your soldiers have occupied your advanced barrier."),
        -- TRANSLATORS: Message sent by an Empire military site
        aggressor = pgettext("europeans_building", "Your advanced barrier discovered an aggressor."),
        -- TRANSLATORS: Message sent by an Empire military site
        attack = pgettext("europeans_building", "Your advanced barrier is under attack."),
        -- TRANSLATORS: Message sent by an Empire military site
        defeated_enemy = pgettext("europeans_building", "The enemy defeated your soldiers at the advanced barrier."),
        -- TRANSLATORS: Message sent by an Empire military site
        defeated_you = pgettext("europeans_building", "Your soldiers defeated the enemy at the advanced barrier.")
    },
}

pop_textdomain()
