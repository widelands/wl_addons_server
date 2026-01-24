push_textdomain("sumatran_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "sumatran_sentry_small",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("sumatran_building", "Small Sentry"),
    icon = dirname .. "menu.png",

    size = "small",
    destructible = true,
    
    buildcost = {
        log = 1,
        granite = 1,
        palmleaves = 1
    },
    return_on_dismantle = {
        granite = 1
    },

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 34, 83 }
      }
    },
    
    aihints = {
        expansion = true,
        fighting = true,
        basic_amount = 3
    },

    max_soldiers = 2,
    vision_range = 10,
    heal_per_second = 80,
    conquers = 6,
    prefer_heroes = false,

    messages = {
        -- TRANSLATORS: Message sent by a Sumatran military site
        occupied = pgettext("sumatran_building", "Your warriors have occupied your sentry."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        aggressor = pgettext("sumatran_building", "Your sentry discovered an aggressor."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        attack = pgettext("sumatran_building", "Your sentry is under attack."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        defeated_enemy = pgettext("sumatran_building", "The enemy defeated your warriors at the sentry."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        defeated_you = pgettext("sumatran_building", "Your warriors defeated the enemy at the sentry.")
    },
}

pop_textdomain()
