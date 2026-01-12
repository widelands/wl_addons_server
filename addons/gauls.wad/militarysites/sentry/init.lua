push_textdomain("gauls.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "gauls_sentry",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("gauls_building", "Sentry"),
    icon = dirname .. "menu.png",

   buildcost = {
      granite = 3,
      planks = 1,
      brick = 2,
   },
   return_on_dismantle = {
      granite = 2,
      brick = 1,
   },

   enhancement = {
      name = "gauls_stone_tower",
      enhancement_cost = {
         granite = 3,
         brick = 1,
         cloth = 2
      },
      enhancement_return_on_dismantle = {
         granite = 1,
         brick = 1,
         cloth = 1
      }
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
        prohibited_till = 780,
        basic_amount = 2,
        expansion = true,
        mountain_conqueror = true
    },

    max_soldiers = 4,
    vision_range = 10,
    heal_per_second = 150,
    conquers = 8,
    prefer_heroes = false,

    messages = {
        -- TRANSLATORS: Message sent by a Gallic military site
        occupied = pgettext("gauls_building", "Your warriors have occupied your sentry."),
        -- TRANSLATORS: Message sent by a Gallic military site
        aggressor = pgettext("gauls_building", "Your sentry discovered an aggressor."),
        -- TRANSLATORS: Message sent by a Gallic military site
        attack = pgettext("gauls_building", "Your sentry is under attack."),
        -- TRANSLATORS: Message sent by a Gallic military site
        defeated_enemy = pgettext("gauls_building", "The enemy defeated your warriors at the sentry."),
        -- TRANSLATORS: Message sent by a Gallic military site
        defeated_you = pgettext("gauls_building", "Your warriors defeated the enemy at the sentry.")
    },
}

pop_textdomain()
