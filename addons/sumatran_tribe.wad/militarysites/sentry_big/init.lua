push_textdomain("sumatran_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "sumatran_sentry_big",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("sumatran_building", "Big Sentry"),
    icon = dirname .. "menu.png",

    enhancement = {
        name = "sumatran_fortified_tower",
        enhancement_cost = {
            stone = 1,
            tropicalwood = 1,
            diamond = 2,
        },
        enhancement_return_on_dismantle = {
            tropicalwood = 1,
            diamond = 1
        },
    },
   buildcost = {
      log = 1,
      stone = 3,
      tropicalwood = 3,
      reed = 2,
      cloth = 1
   },
   return_on_dismantle = {
      stone = 2,
      tropicalwood = 2,
   },

    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 40, 107 }
      },
    },
    size = "medium",
    destructible = true,
    

    aihints = {
        prohibited_till = 900,
        mountain_conqueror = true
    },

    max_soldiers = 6,
    vision_range = 10,
    heal_per_second = 150,
    conquers = 9,
    prefer_heroes = true,

    messages = {
        -- TRANSLATORS: Message sent by a Sumatran military site
        occupied = pgettext("sumatran_building", "Your warriors have occupied your big sentry."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        aggressor = pgettext("sumatran_building", "Your big sentry discovered an aggressor."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        attack = pgettext("sumatran_building", "Your big sentry is under attack."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        defeated_enemy = pgettext("sumatran_building", "The enemy defeated your warriors at the big sentry."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        defeated_you = pgettext("sumatran_building", "Your warriors defeated the enemy at the big sentry.")
    },
}

pop_textdomain()
