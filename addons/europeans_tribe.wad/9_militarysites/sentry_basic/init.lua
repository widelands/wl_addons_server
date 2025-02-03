push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "europeans_sentry_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Sentry"),
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
    
    size = "small",
    destructible = true,
    
    buildcost = {
        granite = 2,
        marble = 1,
        log = 2,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 1,
        reed = 1,
        granite = 1,
        marble = 1
    },
    
    aihints = {
        expansion = true
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
