push_textdomain("gauls.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "gauls_castle",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("gauls_building", "Castle"),
    icon = dirname .. "menu.png",

    size = "big",
    destructible = true,
    
    buildcost = {
        granite = 5,
        planks = 2,
        brick = 5,
        reed = 1,
        cloth = 2,
    },
    return_on_dismantle = {
        granite = 3,
        planks = 1,
        brick = 2,
    },

   enhancement = {
      name = "gauls_stronghold",
      enhancement_cost = {
         granite = 3,
         bronze = 1,
         copper = 1,
         gold = 1
      },
      enhancement_return_on_dismantle = {
         granite = 2,
         bronze = 1,
         copper = 1
      }
   },

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 99, 113 }
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 99, 113 }
      },
    },
    
    aihints = {
        fighting = true,
        mountain_conqueror = true
    },

    max_soldiers = 8,
    vision_range = 14,
    heal_per_second = 200,
    conquers = 11,
    prefer_heroes = true,

    messages = {
        -- TRANSLATORS: Message sent by a Gallic military site
        occupied = pgettext("gauls_building", "Your warriors have occupied your castle."),
        -- TRANSLATORS: Message sent by a Gallic military site
        aggressor = pgettext("gauls_building", "Your castle discovered an aggressor."),
        -- TRANSLATORS: Message sent by a Gallic military site
        attack = pgettext("gauls_building", "Your castle is under attack."),
        -- TRANSLATORS: Message sent by a Gallic military site
        defeated_enemy = pgettext("gauls_building", "The enemy defeated your warriors at the castle."),
        -- TRANSLATORS: Message sent by a Gallic military site
        defeated_you = pgettext("gauls_building", "Your warriors defeated the enemy at the castle.")
    },
}

pop_textdomain()
