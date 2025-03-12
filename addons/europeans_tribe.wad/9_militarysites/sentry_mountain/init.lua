push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/militarysites/barbarians/sentry/"

wl.Descriptions():new_militarysite_type {
    name = "europeans_sentry_mountain",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Mountain Sentry"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      unoccupied = {
         hotspot = { 39, 40 }
      }
    },
    spritesheets = {
        idle = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 39, 40 }
        },
        build = {
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 39, 40 }
        },
    },
    
    size = "mine",
    destructible = true,
    
    buildcost = {
        granite = 2,
        log = 2,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 1,
        reed = 1,
        granite = 1
    },
    
    aihints = {
        mountain_conqueror = true
    },

    max_soldiers = 2,
    vision_range = 8,
    heal_per_second = 60,
    conquers = 4,
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
